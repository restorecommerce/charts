#!/bin/bash

set -euxo pipefail

for CHART_DIR in ./charts/*; do
  helm dependency update "${CHART_DIR}"
done

ct lint --all --config .github/ct.yaml

helm-docs

KUBERNETES_VERSION=1.19.2 ./.github/kubeval.sh