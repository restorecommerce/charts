# Restorecommerce Helm Charts

Helm chart index:

* [access-control-srv](./charts/access-control-srv)
* [catalog-srv](./charts/catalog-srv)
* [console](./charts/console)
* [facade-srv](./charts/facade-srv)
* [fulfillment-srv](./charts/fulfillment-srv)
* [identity-srv](./charts/identity-srv)
* [invoicing-srv](./charts/invoicing-srv)
* [notification-srv](./charts/notification-srv)
* [ordering-srv](./charts/ordering-srv)
* [ostorage-srv](./charts/ostorage-srv)
* [payment-srv](./charts/payment-srv)
* [pdf-rendering-srv](./charts/pdf-rendering-srv)
* [rendering-srv](./charts/rendering-srv)
* [resource-srv](./charts/resource-srv)
* [scheduling-srv](./charts/scheduling-srv)
* [store-front](./charts/store-front)
* [system](./charts/system)

## Installation

You can install this helm repository via:

```bash
helm repo add restorecommerce https://restorecommerce.github.io/charts/
helm repo update
```

## Example Deployment

There is an example deployment with all required dependencies specified in [example](./example) directory.

It uses the [helmfile](https://github.com/roboll/helmfile) tool to specify all releases and their values.

## Development

After any changes to a chart you must always increment the version number in the appropriate `Chart.yaml` file and afterwards execute the pre-commit script!

| :warning: Make sure to **ALWAYS** run the `./pre-commit.sh` script (below) before committing and pushing! |
|:------------|

### Pre-Commit

This is a required step to update all charts to lint them, test them and generate their docs.

First install all necessary packages via `pip3 install -r requirements.txt`.

Then execute the script:

```bash
./pre-commit.sh
```

## Packaging and Releasing

Releases are automated via github workflows. Anything pushed to master is considered as to be released!

Do not ever manually package and release the charts!
