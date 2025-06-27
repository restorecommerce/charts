# system

![Version: 0.1.114](https://img.shields.io/badge/Version-0.1.114-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
|  | cloudserver | 1.0.5 |
| https://arangodb.github.io/kube-arangodb | kube-arangodb | 1.2.46 |
| oci://ghcr.io/restorecommerce/charts | access-control-srv | 0.1.41 |
| oci://ghcr.io/restorecommerce/charts | catalog-srv | 0.1.33 |
| oci://ghcr.io/restorecommerce/charts | facade-srv | 0.1.41 |
| oci://ghcr.io/restorecommerce/charts | fulfillment-srv | 0.1.42 |
| oci://ghcr.io/restorecommerce/charts | identity-srv | 0.1.56 |
| oci://ghcr.io/restorecommerce/charts | invoicing-srv | 0.1.34 |
| oci://ghcr.io/restorecommerce/charts | notification-srv | 0.1.30 |
| oci://ghcr.io/restorecommerce/charts | ordering-srv | 0.1.52 |
| oci://ghcr.io/restorecommerce/charts | ostorage-srv | 0.1.33 |
| oci://ghcr.io/restorecommerce/charts | payment-srv | 0.1.21 |
| oci://ghcr.io/restorecommerce/charts | pdf-rendering-srv | 0.2.12 |
| oci://ghcr.io/restorecommerce/charts | rendering-srv | 0.1.36 |
| oci://ghcr.io/restorecommerce/charts | resource-srv | 0.1.31 |
| oci://ghcr.io/restorecommerce/charts | scheduling-srv | 0.1.24 |
| oci://registry-1.docker.io/bitnamicharts | kafka | 31.4.1 |
| oci://registry-1.docker.io/bitnamicharts | redis | 20.11.1 |
