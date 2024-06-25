

-- #+RESULTS:
-- #+begin_example
-- BEGIN
-- apisnoop=*# apisnoop(*# apisnoop-*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# apisnoop$*# CREATE FUNCTION
-- apisnoop=*# RESET
-- apisnoop=*# apisnoop=*#        ?column?
-- -----------------------
--  %(Gateway|HTTPRoute)%
-- (1 row)

-- apisnoop=*# apisnoop=*# DELETE 935
-- apisnoop=*# INFO:  {"standard": "%(Gateway|HTTPRoute)%"}
--  load_live_open_api_test
-- -------------------------
--  live open api is loaded
-- (1 row)

-- apisnoop=*# apisnoop=*#                               endpoint                               |    level
-- ---------------------------------------------------------------------+--------------
--  createGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy           | experimental
--  createGatewayNetworkingV1alpha2NamespacedGRPCRoute                  | experimental
--  createGatewayNetworkingV1alpha2NamespacedReferenceGrant             | experimental
--  createGatewayNetworkingV1alpha2NamespacedTCPRoute                   | experimental
--  createGatewayNetworkingV1alpha2NamespacedTLSRoute                   | experimental
--  createGatewayNetworkingV1alpha2NamespacedUDPRoute                   | experimental
--  createGatewayNetworkingV1beta1GatewayClass                          | experimental
--  createGatewayNetworkingV1beta1NamespacedGateway                     | experimental
--  createGatewayNetworkingV1beta1NamespacedHTTPRoute                   | experimental
--  createGatewayNetworkingV1beta1NamespacedReferenceGrant              | experimental
--  createGatewayNetworkingV1GatewayClass                               | standard
--  createGatewayNetworkingV1NamespacedGateway                          | standard
--  createGatewayNetworkingV1NamespacedHTTPRoute                        | standard
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedBackendTLSPolicy | experimental
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedGRPCRoute        | experimental
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedReferenceGrant   | experimental
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedTCPRoute         | experimental
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedTLSRoute         | experimental
--  deleteGatewayNetworkingV1alpha2CollectionNamespacedUDPRoute         | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy           | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedGRPCRoute                  | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedReferenceGrant             | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedTCPRoute                   | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedTLSRoute                   | experimental
--  deleteGatewayNetworkingV1alpha2NamespacedUDPRoute                   | experimental
--  deleteGatewayNetworkingV1beta1CollectionGatewayClass                | experimental
--  deleteGatewayNetworkingV1beta1CollectionNamespacedGateway           | experimental
--  deleteGatewayNetworkingV1beta1CollectionNamespacedHTTPRoute         | experimental
--  deleteGatewayNetworkingV1beta1CollectionNamespacedReferenceGrant    | experimental
--  deleteGatewayNetworkingV1beta1GatewayClass                          | experimental
--  deleteGatewayNetworkingV1beta1NamespacedGateway                     | experimental
--  deleteGatewayNetworkingV1beta1NamespacedHTTPRoute                   | experimental
--  deleteGatewayNetworkingV1beta1NamespacedReferenceGrant              | experimental
--  deleteGatewayNetworkingV1CollectionGatewayClass                     | standard
--  deleteGatewayNetworkingV1CollectionNamespacedGateway                | standard
--  deleteGatewayNetworkingV1CollectionNamespacedHTTPRoute              | standard
--  deleteGatewayNetworkingV1GatewayClass                               | standard
--  deleteGatewayNetworkingV1NamespacedGateway                          | standard
--  deleteGatewayNetworkingV1NamespacedHTTPRoute                        | standard
--  listGatewayNetworkingV1alpha2BackendTLSPolicyForAllNamespaces       | experimental
--  listGatewayNetworkingV1alpha2GRPCRouteForAllNamespaces              | experimental
--  listGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy             | experimental
--  listGatewayNetworkingV1alpha2NamespacedGRPCRoute                    | experimental
--  listGatewayNetworkingV1alpha2NamespacedReferenceGrant               | experimental
--  listGatewayNetworkingV1alpha2NamespacedTCPRoute                     | experimental
--  listGatewayNetworkingV1alpha2NamespacedTLSRoute                     | experimental
--  listGatewayNetworkingV1alpha2NamespacedUDPRoute                     | experimental
--  listGatewayNetworkingV1alpha2ReferenceGrantForAllNamespaces         | experimental
--  listGatewayNetworkingV1alpha2TCPRouteForAllNamespaces               | experimental
--  listGatewayNetworkingV1alpha2TLSRouteForAllNamespaces               | experimental
--  listGatewayNetworkingV1alpha2UDPRouteForAllNamespaces               | experimental
--  listGatewayNetworkingV1beta1GatewayClass                            | experimental
--  listGatewayNetworkingV1beta1GatewayForAllNamespaces                 | experimental
--  listGatewayNetworkingV1beta1HTTPRouteForAllNamespaces               | experimental
--  listGatewayNetworkingV1beta1NamespacedGateway                       | experimental
--  listGatewayNetworkingV1beta1NamespacedHTTPRoute                     | experimental
--  listGatewayNetworkingV1beta1NamespacedReferenceGrant                | experimental
--  listGatewayNetworkingV1beta1ReferenceGrantForAllNamespaces          | experimental
--  listGatewayNetworkingV1GatewayClass                                 | standard
--  listGatewayNetworkingV1GatewayForAllNamespaces                      | standard
--  listGatewayNetworkingV1HTTPRouteForAllNamespaces                    | standard
--  listGatewayNetworkingV1NamespacedGateway                            | standard
--  listGatewayNetworkingV1NamespacedHTTPRoute                          | standard
--  patchGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy            | experimental
--  patchGatewayNetworkingV1alpha2NamespacedBackendTLSPolicyStatus      | experimental
--  patchGatewayNetworkingV1alpha2NamespacedGRPCRoute                   | experimental
--  patchGatewayNetworkingV1alpha2NamespacedGRPCRouteStatus             | experimental
--  patchGatewayNetworkingV1alpha2NamespacedReferenceGrant              | experimental
--  patchGatewayNetworkingV1alpha2NamespacedTCPRoute                    | experimental
--  patchGatewayNetworkingV1alpha2NamespacedTCPRouteStatus              | experimental
--  patchGatewayNetworkingV1alpha2NamespacedTLSRoute                    | experimental
--  patchGatewayNetworkingV1alpha2NamespacedTLSRouteStatus              | experimental
--  patchGatewayNetworkingV1alpha2NamespacedUDPRoute                    | experimental
--  patchGatewayNetworkingV1alpha2NamespacedUDPRouteStatus              | experimental
--  patchGatewayNetworkingV1beta1GatewayClass                           | experimental
--  patchGatewayNetworkingV1beta1GatewayClassStatus                     | experimental
--  patchGatewayNetworkingV1beta1NamespacedGateway                      | experimental
--  patchGatewayNetworkingV1beta1NamespacedGatewayStatus                | experimental
--  patchGatewayNetworkingV1beta1NamespacedHTTPRoute                    | experimental
--  patchGatewayNetworkingV1beta1NamespacedHTTPRouteStatus              | experimental
--  patchGatewayNetworkingV1beta1NamespacedReferenceGrant               | experimental
--  patchGatewayNetworkingV1GatewayClass                                | standard
--  patchGatewayNetworkingV1GatewayClassStatus                          | standard
--  patchGatewayNetworkingV1NamespacedGateway                           | standard
--  patchGatewayNetworkingV1NamespacedGatewayStatus                     | standard
--  patchGatewayNetworkingV1NamespacedHTTPRoute                         | standard
--  patchGatewayNetworkingV1NamespacedHTTPRouteStatus                   | standard
--  readGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy             | experimental
--  readGatewayNetworkingV1alpha2NamespacedBackendTLSPolicyStatus       | experimental
--  readGatewayNetworkingV1alpha2NamespacedGRPCRoute                    | experimental
--  readGatewayNetworkingV1alpha2NamespacedGRPCRouteStatus              | experimental
--  readGatewayNetworkingV1alpha2NamespacedReferenceGrant               | experimental
--  readGatewayNetworkingV1alpha2NamespacedTCPRoute                     | experimental
--  readGatewayNetworkingV1alpha2NamespacedTCPRouteStatus               | experimental
--  readGatewayNetworkingV1alpha2NamespacedTLSRoute                     | experimental
--  readGatewayNetworkingV1alpha2NamespacedTLSRouteStatus               | experimental
--  readGatewayNetworkingV1alpha2NamespacedUDPRoute                     | experimental
--  readGatewayNetworkingV1alpha2NamespacedUDPRouteStatus               | experimental
--  readGatewayNetworkingV1beta1GatewayClass                            | experimental
--  readGatewayNetworkingV1beta1GatewayClassStatus                      | experimental
--  readGatewayNetworkingV1beta1NamespacedGateway                       | experimental
--  readGatewayNetworkingV1beta1NamespacedGatewayStatus                 | experimental
--  readGatewayNetworkingV1beta1NamespacedHTTPRoute                     | experimental
--  readGatewayNetworkingV1beta1NamespacedHTTPRouteStatus               | experimental
--  readGatewayNetworkingV1beta1NamespacedReferenceGrant                | experimental
--  readGatewayNetworkingV1GatewayClass                                 | standard
--  readGatewayNetworkingV1GatewayClassStatus                           | standard
--  readGatewayNetworkingV1NamespacedGateway                            | standard
--  readGatewayNetworkingV1NamespacedGatewayStatus                      | standard
--  readGatewayNetworkingV1NamespacedHTTPRoute                          | standard
--  readGatewayNetworkingV1NamespacedHTTPRouteStatus                    | standard
--  replaceGatewayNetworkingV1alpha2NamespacedBackendTLSPolicy          | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedBackendTLSPolicyStatus    | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedGRPCRoute                 | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedGRPCRouteStatus           | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedReferenceGrant            | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedTCPRoute                  | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedTCPRouteStatus            | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedTLSRoute                  | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedTLSRouteStatus            | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedUDPRoute                  | experimental
--  replaceGatewayNetworkingV1alpha2NamespacedUDPRouteStatus            | experimental
--  replaceGatewayNetworkingV1beta1GatewayClass                         | experimental
--  replaceGatewayNetworkingV1beta1GatewayClassStatus                   | experimental
--  replaceGatewayNetworkingV1beta1NamespacedGateway                    | experimental
--  replaceGatewayNetworkingV1beta1NamespacedGatewayStatus              | experimental
--  replaceGatewayNetworkingV1beta1NamespacedHTTPRoute                  | experimental
--  replaceGatewayNetworkingV1beta1NamespacedHTTPRouteStatus            | experimental
--  replaceGatewayNetworkingV1beta1NamespacedReferenceGrant             | experimental
--  replaceGatewayNetworkingV1GatewayClass                              | standard
--  replaceGatewayNetworkingV1GatewayClassStatus                        | standard
--  replaceGatewayNetworkingV1NamespacedGateway                         | standard
--  replaceGatewayNetworkingV1NamespacedGatewayStatus                   | standard
--  replaceGatewayNetworkingV1NamespacedHTTPRoute                       | standard
--  replaceGatewayNetworkingV1NamespacedHTTPRouteStatus                 | standard
-- (135 rows)

-- apisnoop=*# apisnoop=*# ROLLBACK
-- #+end_example

-- create function load_live_open_api


begin;
create or replace function load_live_open_api (
  )
returns text AS $$
from string import Template
import json
import time
import datetime
from urllib.request import Request, urlopen, urlretrieve
import urllib
import yaml
import ssl
from pathlib import Path

ssl._create_default_https_context = ssl._create_unverified_context
token = Path('/opt/token.txt').read_text()
req = Request('https://kubernetes.default.svc/openapi/v2')
req.add_header('Authorization','Bearer ' + token)

open_api = json.loads(urlopen(req).read().decode('utf-8'))
release =  'live'
release_date = time.mktime(datetime.datetime.now().timetuple())
open_api_url = 'incluster'

levels = {
       'standard': [
            'Gateway',
            'HTTPRoute'
        ]
}
for level in levels:
  levels[level] = '%(' + '|'.join(levels[level]) + ')%'
levels = json.dumps(levels)

sql = Template("""
   WITH open AS (
     SELECT '${open_api}'::jsonb as api_data, '${levels}'::jsonb as "levels"
     )
       INSERT INTO open_api(
         release,
         release_date,
         endpoint,
         level,
         category,
         path,
         k8s_group,
         k8s_version,
         k8s_kind,
         k8s_action,
         deprecated,
         description,
         spec
       )
   SELECT
     '${release}' as release,
     to_timestamp(${release_date}) as release_date,
     (d.value ->> 'operationId'::text) as endpoint,
     CASE
       WHEN not (paths.key ~~ '%alpha%' or paths.key ~~ '%beta%')
            and (d.value ->> 'operationId'::text) similar to levels::jsonb ->> 'standard'
                THEN 'standard'
       ELSE 'experimental'
     END AS level,
     split_part((cat_tag.value ->> 0), '_'::text, 1) AS category,
     paths.key AS path,
     ((d.value -> 'x-kubernetes-group-version-kind'::text) ->> 'group'::text) AS k8s_group,
     ((d.value -> 'x-kubernetes-group-version-kind'::text) ->> 'version'::text) AS k8s_version,
     ((d.value -> 'x-kubernetes-group-version-kind'::text) ->> 'kind'::text) AS k8s_kind,
     (d.value ->> 'x-kubernetes-action'::text) AS k8s_action,
     CASE
       WHEN (lower((d.value ->> 'description'::text)) ~~ '%deprecated%'::text) THEN true
       ELSE false
     END AS deprecated,
                 (d.value ->> 'description'::text) AS description,
                 '${open_api_url}' as spec
     FROM
         open
          , jsonb_each((open.api_data -> 'paths'::text)) paths(key, value)
          , jsonb_each(paths.value) d(key, value)
          , jsonb_array_elements((d.value -> 'tags'::text)) cat_tag(value)
    ORDER BY paths.key;
              """).substitute(release = release,
                              release_date = str(release_date),
                              open_api = json.dumps(open_api).replace("'","''"),
                              open_api_url = open_api_url,
                              levels = levels)
try:
  plpy.execute((sql))
  return "{} open api is loaded".format(release)
except Exception as e:
  return "an error occurred: " + str(e) + "\nrelease: " + release
$$ LANGUAGE plpython3u ;
reset role;

comment on function load_live_open_api is 'loads given release to open_api table from incluster api spec.';

select 'load_live_open_api function defined and commented' as "build log";
commit;



-- #+RESULTS:
-- #+begin_example
--                               List of functions
--  Schema |        Name        | Result data type | Argument data types | Type
-- --------+--------------------+------------------+---------------------+------
--  public | load_live_open_api | text             |                     | func
-- (1 row)

-- #+end_example


select * from load_live_open_api();
