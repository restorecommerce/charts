# Restorecommerce Helm Charts

This repository contains helm charts for the following services:

* [access-control-srv](./charts/access-control-srv)
* [identity-srv](./charts/identity-srv)
* [notification-srv](./charts/notification-srv)
* [ostorage-srv](./charts/ostorage-srv)
* [pdf-rendering-srv](./charts/pdf-rendering-srv)
* [rendering-srv](./charts/rendering-srv)
* [scheduling-srv](./charts/scheduling-srv)

## Installation

You can install this helm repository via

```bash
helm repo add restorecommerce https://restorecommerce.github.io/helm/
helm repo update
```

## Example Deployment

There is an example deployment with all required dependencies specified in [example](./example) directory.

It uses the [helmfile](https://github.com/roboll/helmfile) tool to specify all releases and their values.

## Development

### Linting

Linting uses the [chart-testing](https://github.com/helm/chart-testing) tool

```bash
ct lint
```

### Documentation Generation

Documentation generation uses the [helm-docs](https://github.com/norwoodj/helm-docs) tool

```bash
helm-docs
```

### Chart Validation

Validation uses the [kubeval](https://github.com/instrumenta/kubeval) tool

```bash
for CHART_DIR in ./charts/*; do
  helm template "${CHART_DIR}" | kubeval --strict --ignore-missing-schemas
done
```

### Releasing

Releasing uses the [chart-releaser](https://github.com/helm/chart-releaser) tool

```bash
cr upload --config chart-releaser.yaml --token <GITHUB_TOKEN>
```