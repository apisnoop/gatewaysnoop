#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

POSTGRES_CONNECTION=${POSTGRES_CONNECTION:-"postgresql://apisnoop@localhost/apisnoop"}

SOURCE_DIR=${SOURCE_DIR:-"${HOME}/src/github.com/apisnoop"}
PUBLISH_DIR=${PUBLISH_DIR:-"${SOURCE_DIR}/gatewaysnoop/tmp/coverage"}
GTWTFW_DIR=${GTWTFW_DIR:-"${SOURCE_DIR}/gateway-api-test-framework"}
GTWSNOOP_DIR=${GTWSNOOP_DIR:-"${SOURCE_DIR}/gatewaysnoop"}
export CONFIG_DIR="$GTWTFW_DIR/config" ENABLE_APISNOOP=true
mkdir -p "$PUBLISH_DIR"

# bit of a hack to put all the data in the same place
ITERS=(
    'export GATEWAY_API_VERSION="v1.0.0" IMPLEMENTATION_VERSION="v1.15.4" IMPLEMENTATION=cilium RELEASE=1.1008100.0'
    'export GATEWAY_API_VERSION="v1.1.0" IMPLEMENTATION_VERSION="v1.15.6" IMPLEMENTATION=cilium RELEASE=1.1008110.0'
    'export GATEWAY_API_VERSION="v1.0.0" IMPLEMENTATION_VERSION="v1.29.0" IMPLEMENTATION=contour RELEASE=1.1009100.0'
    'export GATEWAY_API_VERSION="v1.0.0" IMPLEMENTATION_VERSION="1.22.1" IMPLEMENTATION=istio RELEASE=1.1019100.0'
    'export GATEWAY_API_VERSION="v1.1.0" IMPLEMENTATION_VERSION="1.22.2" IMPLEMENTATION=istio RELEASE=1.1019110.0'
)

for ITER in "${ITERS[@]}"; do
    eval "$ITER"
    OUTPUT="gateway-api-${GATEWAY_API_VERSION}-${IMPLEMENTATION}-${IMPLEMENTATION_VERSION}"
    kind delete cluster
    cd "$GTWTFW_DIR"
    ./deploy-kind-gtw-api-cluster.sh

    # make sure that apisnoop is 100% set to log all events
    kubectl -n apisnoop wait --for=condition=Ready --selector="app.kubernetes.io/name=snoopdb" --timeout=600s pod
    kubectl -n apisnoop wait --for=condition=Ready --selector="app.kubernetes.io/name=auditlogger" --timeout=600s pod

    until psql "${POSTGRES_CONNECTION}" -c 'select true as "ready";'; do sleep 15; done
    psql "${POSTGRES_CONNECTION}" -f "$GTWSNOOP_DIR/org/00-load_live_open_api.sql"
    sleep 5
    ./run-conformance-suite.sh || true # exits 1 because /tmp/conformance-suite-report* doesn't exist
    psql "${POSTGRES_CONNECTION}" -f "$GTWSNOOP_DIR/org/01-gateway_api_endpoint_coverage.sql"
    mv /tmp/coverage/gateway-api.json "$PUBLISH_DIR/$OUTPUT.json"
    cp "$PUBLISH_DIR/$OUTPUT.json" "$PUBLISH_DIR/$RELEASE.json"

    tmp=$(mktemp)
    jq --arg r "$RELEASE" \
       '.sources = ["https://github.com/apisnoop/gateway-api-test-framework/"] | .release = ($r) | .endpoints[].release = ($r)' \
       "$PUBLISH_DIR/$RELEASE.json" > "$tmp" && \
    mv "$tmp" "$PUBLISH_DIR/$RELEASE.json"
done
