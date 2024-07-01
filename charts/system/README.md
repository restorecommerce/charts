# system

![Version: 0.1.90](https://img.shields.io/badge/Version-0.1.90-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| https://charts.bitnami.com/bitnami | kafka | 29.0.3 |
| https://charts.bitnami.com/bitnami | redis | 19.5.0 |
| https://restorecommerce.github.io/charts/ | access-control-srv | 0.1.33 |
| https://restorecommerce.github.io/charts/ | catalog-srv | 0.1.20 |
| https://restorecommerce.github.io/charts/ | facade-srv | 0.1.31 |
| https://restorecommerce.github.io/charts/ | fulfillment-srv | 0.1.21 |
| https://restorecommerce.github.io/charts/ | identity-srv | 0.1.38 |
| https://restorecommerce.github.io/charts/ | invoicing-srv | 0.1.21 |
| https://restorecommerce.github.io/charts/ | notification-srv | 0.1.28 |
| https://restorecommerce.github.io/charts/ | ordering-srv | 0.1.22 |
| https://restorecommerce.github.io/charts/ | ostorage-srv | 0.1.27 |
| https://restorecommerce.github.io/charts/ | payment-srv | 0.1.19 |
| https://restorecommerce.github.io/charts/ | pdf-rendering-srv | 0.2.6 |
| https://restorecommerce.github.io/charts/ | rendering-srv | 0.1.31 |
| https://restorecommerce.github.io/charts/ | resource-srv | 0.1.22 |
| https://restorecommerce.github.io/charts/ | scheduling-srv | 0.1.22 |
