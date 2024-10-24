# system

![Version: 0.1.106](https://img.shields.io/badge/Version-0.1.106-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for the Restorecommerce system

## Dependencies

### ArangoDB

This chart depends on having the ArangoDB operator and CRD's installed in the cluster.

Replace the `restorecommerce` namespace with your own.

```shell
helm install arangodb-crd https://github.com/arangodb/kube-arangodb/releases/download/1.2.39/kube-arangodb-crd-1.2.39.tgz
helm install --create-namespace -n restorecommerce arangodb-operator https://github.com/arangodb/kube-arangodb/releases/download/1.2.39/kube-arangodb-1.2.39.tgz
```

### Elastic

This chart depends on having the Elastic operator and CRD's installed in the cluster.

Replace the `restorecommerce` namespace with your own.

```shell
helm repo add elastic https://helm.elastic.co
helm repo update
helm install --create-namespace -n restorecommerce elastic-operator elastic/eck-operator --version 2.11.1
```

**Homepage:** <https://github.com/restorecommerce/system>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| restorecommerce | <info@restorecommerce.io> | <https://restorecommerce.io/> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | cloudserver | 1.0.4 |
| https://charts.bitnami.com/bitnami | kafka | 29.3.6 |
| https://charts.bitnami.com/bitnami | redis | 19.6.1 |
| https://restorecommerce.github.io/charts/ | access-control-srv | 0.1.37 |
| https://restorecommerce.github.io/charts/ | catalog-srv | 0.1.22 |
| https://restorecommerce.github.io/charts/ | facade-srv | 0.1.33 |
| https://restorecommerce.github.io/charts/ | fulfillment-srv | 0.1.26 |
| https://restorecommerce.github.io/charts/ | identity-srv | 0.1.45 |
| https://restorecommerce.github.io/charts/ | invoicing-srv | 0.1.22 |
| https://restorecommerce.github.io/charts/ | notification-srv | 0.1.29 |
| https://restorecommerce.github.io/charts/ | ordering-srv | 0.1.35 |
| https://restorecommerce.github.io/charts/ | ostorage-srv | 0.1.28 |
| https://restorecommerce.github.io/charts/ | payment-srv | 0.1.20 |
| https://restorecommerce.github.io/charts/ | pdf-rendering-srv | 0.2.7 |
| https://restorecommerce.github.io/charts/ | rendering-srv | 0.1.32 |
| https://restorecommerce.github.io/charts/ | resource-srv | 0.1.24 |
| https://restorecommerce.github.io/charts/ | scheduling-srv | 0.1.23 |
