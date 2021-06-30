#!/usr/bin/env python3

# Upgrades all charts to highest available semver-compatible versions

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
            appVersion = chart["appVersion"]

        print(dir, chartVersion, image, appVersion)

        if "/" not in image:
            image = "library/" + image

        if image.count("/") == 1:
            image = "index.docker.io/" + image

        url = urlparse("https://" + image)

        try:
            dxf_obj = dxf.DXF(url.netloc, url.path[1:])
            dxf_obj.authenticate(actions=['pull'])
            aliases = dxf_obj.list_aliases()
            
            highestSemver = appVersion
            for alias in aliases:
                if semver.VersionInfo.isvalid(alias):
                    if semver.compare(highestSemver, alias) == -1:
                        highestSemver = alias

            if appVersion == highestSemver:
                print(appVersion, "==", highestSemver, "skipping")
                continue
            
            print(appVersion, "<", highestSemver, "upgrading")

            chart["appVersion"] = highestSemver
            chart["version"] = str(semver.VersionInfo.parse(chartVersion).bump_patch())

            with open(path.join(dir, "Chart.yaml"), "w") as f:
                dump(chart, f, Dumper)

        except Exception as err:
            print(err)
            print("error, skipping")