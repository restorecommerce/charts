#!/bin/bash

set -euxo pipefail

CHART_TESTING_VERSION="3.4.0"

# install chart-testing
curl --silent --show-error --fail --location --output /tmp/chart-testing.tar.gz https://github.com/helm/chart-testing/releases/download/v"${HELM_DOCS_VERSION}"/chart-testing_"${HELM_DOCS_VERSION}"_linux_amd64.tar.gz
tar -xf /tmp/chart-testing.tar.gz /tmp/chart-testing
sudo install /tmp/chart-testing/ct
