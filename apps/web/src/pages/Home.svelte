<script>
 import { onMount, afterUpdate } from 'svelte';
 import urlExist from 'url-exist';
 import yaml from 'js-yaml';
 import { gte } from '../lib/semver.js';
 import {
     groupBy,
     isEmpty,
     mapValues,
 } from 'lodash-es';

 import {
   EARLIEST_VERSION,
   RELEASES_URL,
   INELIGIBLE_ENDPOINTS_URL,
   PENDING_ENDPOINTS_URL
 } from '../lib/constants.js';

 import {
  releaseJsonExists
 } from '../lib/utils.js';
 import {
   activeFilters,
   activeRelease,
   latestVersion,
   newEndpoints,
   olderNewEndpointsRaw,
   previousVersion,
   releases,
   implementations
 } from '../store';
 import {
   confEndpointsRaw,
   ineligibleEndpoints,
   pendingEndpoints
 } from '../store/conformance.js';
 import Sunburst from '../components/Sunburst/Wrapper.svelte'
 import NewEndpoints from '../components/new-endpoints.svelte';

 export let params;
 export let query;

 $: ({
     version,
     level,
     category,
     endpoint
 } = params);


 afterUpdate(async() => {
     if ($releases && isEmpty($releases)) {

       let implementationsFromYaml = await fetch(`${RELEASES_URL}/implementations.yaml`)
         .then(res => res.blob())
         .then(blob => blob.text())
         .then(yamlString => yaml.load(yamlString))
       implementations.update((val) => implementationsFromYaml);

       let releasesFromYaml = await fetch(`${RELEASES_URL}/releases.yaml`)
         .then(res => res.blob())
         .then(blob => blob.text())
         .then(yamlString => yaml.load(yamlString))
         .then(releases => releases.filter(({version}) => gte(version, EARLIEST_VERSION)))

       let releasesData = await releaseJsonExists(releasesFromYaml)
         .then(releases => {
           return mapValues(groupBy(releases, 'version'),
                            ([{version, release_date}]) => ({
                              release: version,
                              release_date: release_date == '' ? new Date() : release_date,
                              spec: '',
                              source: '',
                              endpoints: [],
                              tests: []
           }))
         });
         releases.update(rel => releasesData);
     }
     if (version === 'latest' || version == null) {
         version = $latestVersion;
     };
     activeFilters.update(af => ({
         ...af,
         version,
         level: level || '',
         category: category || '',
         endpoint: endpoint || '',
         conformanceOnly: query["conformance-only"]
                        ? query["conformance-only"].toLowerCase() === "true"
                        : false,
         excludeIneligible: query["exclude-ineligible"]
                        ? query["exclude-ineligible"].toLowerCase() === "true"
                        : false,
         excludePending: query["exclude-pending"]
                        ? query["exclude-pending"].toLowerCase() === "true"
                        : false
     }));

     if ($activeRelease !== 'older' && isEmpty($activeRelease.endpoints)) {
         let rel = await fetch(`${RELEASES_URL}/${$activeRelease.release}.json`)
             .then(res => res.json());
         releases.update(rels => ({...rels, [$activeRelease.release]: rel}));
     }
     if ($confEndpointsRaw && isEmpty($confEndpointsRaw)) {
         const conformanceEndpoints = await fetch(`${RELEASES_URL}/conformance-endpoints.json`)
             .then(res => res.json());
         confEndpointsRaw.set(conformanceEndpoints);
     }
     if ($ineligibleEndpoints && isEmpty($ineligibleEndpoints)) {
       const ineligible= await fetch(INELIGIBLE_ENDPOINTS_URL)
         .then(res => res.text())
         .then(text=> yaml.load(text));
         ineligibleEndpoints.set(ineligible);
     }
     if ($pendingEndpoints && isEmpty($pendingEndpoints)) {
       const pending = await fetch(PENDING_ENDPOINTS_URL)
         .then(res => res.text())
         .then(text => yaml.load(text))
         pendingEndpoints.set(pending);
     }
     if ($previousVersion !== 'older' && !isEmpty($releases[$previousVersion]) && isEmpty($releases[$previousVersion].endpoints)) {
         let rel = await fetch(`${RELEASES_URL}/${$previousVersion}.json`)
             .then(res => res.json());
         releases.update(rels => ({...rels, [$previousVersion]: rel}));
     }
     if ($olderNewEndpointsRaw.length === 0) {
         let older = await fetch(`${RELEASES_URL}/new-endpoints.json`)
             .then(res=>res.json());
         olderNewEndpointsRaw.set(older);
     }
 });
</script>

<svelte:head>
    <title>GatewaySnoop</title>
</svelte:head>
{#if $activeRelease && $activeRelease.endpoints && $activeRelease.endpoints.length > 0}
    <Sunburst />
    <NewEndpoints />
{:else}
    <em>loading data...</em>
{/if}
