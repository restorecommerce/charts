#!/bin/bash

set -euxo pipefail

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/master -- charts | cut -d '/' -f 2 | uniq)"

if [[ $(git diff --stat) != '' ]]; then
  CHART_DIRS="$(git diff --find-renames --name-only -- charts | cut -d '/' -f 2 | uniq)"
fi

SCHEMA_LOCATION="default"

for CHART_DIR in ${CHART_DIRS}; do
  if [ -d "charts/$CHART_DIR" ] 
  then
    helm template charts/"${CHART_DIR}" | kubeconform --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
  fi
done