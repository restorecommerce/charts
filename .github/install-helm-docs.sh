#!/bin/bash

set -euxo pipefail

HELM_DOCS_VERSION="1.5.0"

# install helm-docs
curl --silent --show-error --fail --location --output /tmp/helm-docs.tar.gz https://github.com/norwoodj/helm-docs/releases/download/v"${HELM_DOCS_VERSION}"/helm-docs_"${HELM_DOCS_VERSION}"_Linux_x86_64.tar.gz
mkdir -p /tmp/helm-docs
tar -xf /tmp/helm-docs.tar.gz -C /tmp/helm-docs
sudo mv /tmp/helm-docs/helm-docs /usr/local/bin/helm-docs
