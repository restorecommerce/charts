#!/bin/bash

set -euxo pipefail

helm repo add restorecommerce https://restorecommerce.github.io/charts/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add elastic https://helm.elastic.co
helm repo add stable https://charts.helm.sh/stable
helm repo add kube-arangodb https://arangodb.github.io/kube-arangodb
