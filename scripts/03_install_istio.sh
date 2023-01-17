#!/bin/bash

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

namespace="istio-system"

helm upgrade "istio-base" \
  --install \
  --wait \
  --debug \
  --create-namespace \
  --namespace $namespace \
  "istio/base"

helm upgrade istiod \
  --install \
  --wait \
  --debug \
  --create-namespace \
  --namespace $namespace \
  --set global.proxy.tracer="openCensusAgent" \
  --set meshConfig.defaultConfig.tracing.sampling=100.00 \
  --set meshConfig.defaultConfig.tracing.openCensusAgent.address="otelcollector.otel.svc.cluster.local:55678" \
  --set meshConfig.defaultConfig.tracing.openCensusAgent.context[0]=W3C_TRACE_CONTEXT \
  "istio/istiod"
