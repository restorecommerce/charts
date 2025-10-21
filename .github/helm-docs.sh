#!/bin/bash

set -euxo pipefail

helm-docs
# Fail, when there are changes
# git diff --exit-code