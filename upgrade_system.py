#!/usr/bin/env python3

# Upgrades system charts to highest available semver-compatible versions of our charts

from os import path
from urllib.parse import urlparse
from yaml import load, dump

try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

import glob
import dxf
import semver

CHART_DIRECTORIES = "charts/*"

CHART_VERSIONS = {}

for dir in glob.glob(CHART_DIRECTORIES):
    if path.exists(path.join(dir, "Chart.yaml")):
        with open(path.join(dir, "Chart.yaml"), "r") as f:
            chart = load(f, Loader)
            CHART_VERSIONS[chart["name"]] = chart["version"]

upgraded = False
with open(path.join("charts/system/", "Chart.yaml"), "r") as f:
    chart = load(f, Loader)
    for i, dep in enumerate(chart["dependencies"]):
        if "repository" in dep and dep["repository"] == "https://restorecommerce.github.io/charts/":
            if CHART_VERSIONS[dep["name"]] != chart["dependencies"][i]["version"]:
                upgraded = True
                chart["dependencies"][i]["version"] = CHART_VERSIONS[dep["name"]]

if upgraded:
    chart["version"] = str(semver.VersionInfo.parse(chart["version"]).bump_patch())
    with open(path.join("charts/system/", "Chart.yaml"), "w") as f:
        dump(chart, f, Dumper)
    