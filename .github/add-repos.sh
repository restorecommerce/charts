#!/bin/bash

set -euxo pipefail

helm repo add restorecommerce https://restorecommerce.github.io/charts/
helm repo add minio https://helm.min.io
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add elastic https://helm.elastic.co
helm repo add stable https://charts.helm.sh/stable
