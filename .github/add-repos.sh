#!/bin/bash

set -euxo pipefail

helm repo add elastic https://helm.elastic.co
helm repo add kube-arangodb https://arangodb.github.io/kube-arangodb
helm repo add rustfs https://charts.rustfs.com 
