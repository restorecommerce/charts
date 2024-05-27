#!/bin/bash

set -euxo pipefail

for CHART_DIR in ./charts/*; do
  helm dependency update --skip-refresh "${CHART_DIR}"
done

ct lint --all --helm-dependency-extra-args='--skip-refresh' --config .github/ct.yaml

helm-docs

./.github/kubeconform.sh