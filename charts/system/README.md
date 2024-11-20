# system

![Version: 0.1.108](https://img.shields.io/badge/Version-0.1.108-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

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
| https://arangodb.github.io/kube-arangodb | kube-arangodb | 1.2.42 |
| oci://ghcr.io/restorecommerce/charts | access-control-srv | 0.1.37 |
| oci://ghcr.io/restorecommerce/charts | catalog-srv | 0.1.22 |
| oci://ghcr.io/restorecommerce/charts | facade-srv | 0.1.33 |
| oci://ghcr.io/restorecommerce/charts | fulfillment-srv | 0.1.27 |
| oci://ghcr.io/restorecommerce/charts | identity-srv | 0.1.45 |
| oci://ghcr.io/restorecommerce/charts | invoicing-srv | 0.1.22 |
| oci://ghcr.io/restorecommerce/charts | notification-srv | 0.1.29 |
| oci://ghcr.io/restorecommerce/charts | ordering-srv | 0.1.35 |
| oci://ghcr.io/restorecommerce/charts | ostorage-srv | 0.1.28 |
| oci://ghcr.io/restorecommerce/charts | payment-srv | 0.1.20 |
| oci://ghcr.io/restorecommerce/charts | pdf-rendering-srv | 0.2.8 |
| oci://ghcr.io/restorecommerce/charts | rendering-srv | 0.1.32 |
| oci://ghcr.io/restorecommerce/charts | resource-srv | 0.1.24 |
| oci://ghcr.io/restorecommerce/charts | scheduling-srv | 0.1.23 |
| oci://registry-1.docker.io/bitnamicharts | kafka | 30.1.7 |
| oci://registry-1.docker.io/bitnamicharts | redis | 20.2.1 |
