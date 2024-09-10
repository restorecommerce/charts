#!/usr/bin/env python3

# Bumps all chart versions

from os import path
from yaml import load, dump

try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

import glob
import semver

CHART_DIRECTORIES = "charts/*"

for dir in glob.glob(CHART_DIRECTORIES):
    if path.exists(path.join(dir, "Chart.yaml")) and path.exists(path.join(dir, "values.yaml")):
        with open(path.join(dir, "values.yaml"), "r") as f:
            values = load(f, Loader)

            if "image" not in values or "repository" not in values["image"]:
                continue

            image = values["image"]["repository"]

            with open(path.join(dir, "Chart.yaml"), "r") as f:
                chart = load(f, Loader)
                chartVersion = chart["version"]

                chart["version"] = str(semver.VersionInfo.parse(chartVersion).bump_patch())

                with open(path.join(dir, "Chart.yaml"), "w") as f:
                    dump(chart, f, Dumper)
