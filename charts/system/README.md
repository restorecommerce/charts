# system

![Version: 0.1.7](https://img.shields.io/badge/Version-0.1.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for the restorecommerce system

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
| https://charts.bitnami.com/bitnami | kafka | 11.8.7 |
| https://charts.bitnami.com/bitnami | redis | 11.2.1 |
| https://helm.elastic.co | elasticsearch | 7.9.2 |
| https://helm.elastic.co | kibana | 7.9.2 |
| https://helm.min.io | minio | 7.0.1 |
| https://restorecommerce.github.io/helm/ | access-control-srv | 0.1.3 |
| https://restorecommerce.github.io/helm/ | catalog-srv | 0.1.1 |
| https://restorecommerce.github.io/helm/ | facade-srv | 0.1.5 |
| https://restorecommerce.github.io/helm/ | fulfillment-srv | 0.1.1 |
| https://restorecommerce.github.io/helm/ | identity-srv | 0.1.4 |
| https://restorecommerce.github.io/helm/ | indexing-srv | 0.1.1 |
| https://restorecommerce.github.io/helm/ | invoicing-srv | 0.1.1 |
| https://restorecommerce.github.io/helm/ | notification-srv | 0.1.3 |
| https://restorecommerce.github.io/helm/ | ordering-srv | 0.1.1 |
| https://restorecommerce.github.io/helm/ | ostorage-srv | 0.1.3 |
| https://restorecommerce.github.io/helm/ | payment-srv | 0.1.2 |
| https://restorecommerce.github.io/helm/ | pdf-rendering-srv | 0.1.2 |
| https://restorecommerce.github.io/helm/ | rendering-srv | 0.1.3 |
| https://restorecommerce.github.io/helm/ | resource-srv | 0.1.0 |
| https://restorecommerce.github.io/helm/ | scheduling-srv | 0.1.3 |