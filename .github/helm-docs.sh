#!/bin/bash

set -euxo pipefail

helm-docs
git diff --exit-code