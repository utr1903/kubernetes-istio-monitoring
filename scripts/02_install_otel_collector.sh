#!/bin/bash

name="otelcollector"
namespace="otel"
newrelicOtlpEndpoint="https://otlp.eu01.nr-data.net:4317"

helm upgrade $name \
  --install \
  --wait \
  --debug \
  --create-namespace \
  --namespace $namespace \
  --set name=$name \
  --set newrelicOtlpEndpoint=$name \
  --set newrelicLicenseKey=$NEWRELIC_LICENSE_KEY \
  "../charts/otelcollector"
