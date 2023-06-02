# system

![Version: 0.1.13](https://img.shields.io/badge/Version-0.1.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for the Restorecommerce system

## WARNING: ArangoDB

This chart depends on having the ArangoDB operator and CRD's installed in the cluster.

Replace the `restorecommerce` namespace with your own.

```shell
helm install arangodb-crd https://github.com/arangodb/kube-arangodb/releases/download/1.2.24/kube-arangodb-crd-1.2.24.tgz
helm install --create-namespace -n restorecommerce arangodb-operator https://github.com/arangodb/kube-arangodb/releases/download/1.2.24/kube-arangodb-1.2.24.tgz
```

## WARNING: Elastic

This chart depends on having the Elastic operator and CRD's installed in the cluster.

Replace the `restorecommerce` namespace with your own.

```shell
helm repo add elastic https://helm.elastic.co
helm repo update
helm install --create-namespace -n restorecommerce elastic-operator elastic/eck-operator
```

**Homepage:** <https://github.com/restorecommerce/system>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| restorecommerce | info@restorecommerce.io | https://restorecommerce.io/ |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | cloudserver | 1.0.4 |
| https://charts.bitnami.com/bitnami | kafka | 21.4.0 |
| https://charts.bitnami.com/bitnami | redis | 17.8.4 |
| https://restorecommerce.github.io/charts/ | access-control-srv | 0.1.12 |
| https://restorecommerce.github.io/charts/ | catalog-srv | 0.1.8 |
| https://restorecommerce.github.io/charts/ | facade-srv | 0.1.13 |
| https://restorecommerce.github.io/charts/ | fulfillment-srv | 0.1.6 |
| https://restorecommerce.github.io/charts/ | identity-srv | 0.1.14 |
| https://restorecommerce.github.io/charts/ | indexing-srv | 0.1.6 |
| https://restorecommerce.github.io/charts/ | invoicing-srv | 0.1.8 |
| https://restorecommerce.github.io/charts/ | notification-srv | 0.1.13 |
| https://restorecommerce.github.io/charts/ | ordering-srv | 0.1.6 |
| https://restorecommerce.github.io/charts/ | ostorage-srv | 0.1.13 |
| https://restorecommerce.github.io/charts/ | payment-srv | 0.1.7 |
| https://restorecommerce.github.io/charts/ | pdf-rendering-srv | 0.1.10 |
| https://restorecommerce.github.io/charts/ | rendering-srv | 0.1.14 |
| https://restorecommerce.github.io/charts/ | resource-srv | 0.1.7 |
| https://restorecommerce.github.io/charts/ | scheduling-srv | 0.1.15 |
