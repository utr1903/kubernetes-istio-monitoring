#!/bin/bash

kind create cluster \
  --name test \
  --config ./helpers/kind-config.yaml
  # --image=kindest/node:v1.24.0
