# system

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for the Restorecommerce system

## WARNING: ArangoDB

Due to how the ArangoDB operator CRD's get deployed, you must manually install the ArangoDB Operator charts.

Replace the `restorecommerce` namespace with your own.

```yaml
helm install arangodb-crd https://github.com/arangodb/kube-arangodb/releases/download/1.1.5/kube-arangodb-crd-1.1.5.tgz
helm install --create-namespace -n restorecommerce arangodb-operator https://github.com/arangodb/kube-arangodb/releases/download/1.1.5/kube-arangodb-1.1.5.tgz
```

**Homepage:** <https://github.com/restorecommerce/system>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| restorecommerce | info@restorecommerce.io | https://restorecommerce.io/ |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | kafka | 20.0.6 |
| https://charts.bitnami.com/bitnami | redis | 17.7.2 |
| https://github.com/scality/cloudserver | cloudserver | 1.0.4 |
| https://helm.elastic.co | elasticsearch | 7.9.2 |
| https://helm.elastic.co | kibana | 7.9.2 |
| https://restorecommerce.github.io/charts/ | access-control-srv | 0.1.3 |
| https://restorecommerce.github.io/charts/ | catalog-srv | 0.1.1 |
| https://restorecommerce.github.io/charts/ | facade-srv | 0.1.5 |
| https://restorecommerce.github.io/charts/ | fulfillment-srv | 0.1.1 |
| https://restorecommerce.github.io/charts/ | identity-srv | 0.1.4 |
| https://restorecommerce.github.io/charts/ | indexing-srv | 0.1.1 |
| https://restorecommerce.github.io/charts/ | invoicing-srv | 0.1.1 |
| https://restorecommerce.github.io/charts/ | notification-srv | 0.1.3 |
| https://restorecommerce.github.io/charts/ | ordering-srv | 0.1.1 |
| https://restorecommerce.github.io/charts/ | ostorage-srv | 0.1.3 |
| https://restorecommerce.github.io/charts/ | payment-srv | 0.1.2 |
| https://restorecommerce.github.io/charts/ | pdf-rendering-srv | 0.1.2 |
| https://restorecommerce.github.io/charts/ | rendering-srv | 0.1.3 |
| https://restorecommerce.github.io/charts/ | resource-srv | 0.1.0 |
| https://restorecommerce.github.io/charts/ | scheduling-srv | 0.1.3 |