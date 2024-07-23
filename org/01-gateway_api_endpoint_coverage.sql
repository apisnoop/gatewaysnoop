begin;
drop view if exists gateway_api_endpoint_coverage;
create view gateway_api_endpoint_coverage as
select release, endpoint, level, category, path, description,
       k8s_kind as kind,
       k8s_version as version,
       k8s_group as group,
       k8s_action as action,
       useragent similar to '(gateway-api-conformance.test|pilot.test|gateway-api.test|conformance.test|live)%' as tested,
       useragent similar to '(gateway-api-conformance.test|pilot.test|gateway-api.test|conformance.test|live)%' as conf_tested,
       array_agg(distinct split_part(test, '::', 3)) as tests,
       split_part(useragent, '::', 2) as gateway_version,
       string_to_array(split_part(useragent, '::', 4), ',') as suite_test_features
  from      open_api
  left join testing.audit_event using (endpoint, release)
 where deprecated is false
       and k8s_group = 'gateway.networking.k8s.io'
 group by release, endpoint, level, category, path, description, useragent, kind, version, k8s_group, k8s_action
 order by level desc, endpoint;
commit;



-- #+RESULTS:
-- #+begin_example
-- BEGIN
-- apisnoop=*# DROP VIEW
-- apisnoop=*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# apisnoop-*# CREATE VIEW
-- apisnoop=*# COMMIT
-- #+end_example

-- create a function to produce a JSON formatted output


begin;
create or replace function generate_latest_gateway_api_coverage_json()
returns json as $$
declare latest_release varchar;
begin
select release into latest_release from testing.audit_event limit 1;
return(
select jsonb_pretty(row_to_json(c)::jsonb) from (
    select open_api.release, open_api.release_date, open_api.spec,
        count(distinct ec.endpoint)  as "total endpoints",
        count(distinct ec.endpoint) filter (where ec.tested is true)  as "tested endpoints",
        (select array_agg(source) from (select source from audit_event where release = latest_release group by source) s) as sources,
        (select array_agg(row_to_json(gateway_api_endpoint_coverage)) from gateway_api_endpoint_coverage where release = latest_release and endpoint is not null) as endpoints,
        (select array_agg(row_to_json(audit_event_test)) from audit_event_test where release = latest_release) as tests
    from open_api
    join gateway_api_endpoint_coverage ec using(release)
    where open_api.release = latest_release
    group by open_api.release, open_api.release_date, open_api.spec) c);
end;
$$ language plpgsql;

commit;



-- #+RESULTS:
-- #+begin_example
-- BEGIN
-- apisnoop=*# apisnoop-*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# CREATE FUNCTION
-- apisnoop=*# apisnoop=*# COMMIT
-- #+end_example

-- write the output of ~generate_latest_gateway_api_coverage_json()~ to ~/tmp/coverage/gateway-api.json~


begin;
 \! mkdir -p /tmp/coverage
 \! rm -f /tmp/coverage/gateway-api.json
 \gset
 \set output_file '/tmp/coverage/gateway-api.json'
 \t
 \a
 \o :output_file
   select * from generate_latest_gateway_api_coverage_json();
 \o
 \a
 \t
commit;
