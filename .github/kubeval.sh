#!/bin/bash

set -euxo pipefail

CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/master -- charts | cut -d '/' -f 2 | uniq)"

if [[ $(git diff --stat) != '' ]]; then
  CHART_DIRS="$(git diff --find-renames --name-only -- charts | cut -d '/' -f 2 | uniq)"
fi

KUBEVAL_VERSION="0.15.0"
SCHEMA_LOCATION="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"

KUBEVAL_PATH="kubeval"

if ! command -v kubeval &> /dev/null; then
  # install kubeval
  curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/download/"${KUBEVAL_VERSION}"/kubeval-linux-amd64.tar.gz
  tar -xf /tmp/kubeval.tar.gz kubeval
  KUBEVAL_PATH="./kubeval"
fi

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  if [ -d "charts/$CHART_DIR" ] 
  then
    helm template charts/"${CHART_DIR}" | $KUBEVAL_PATH --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}"
  fi
done