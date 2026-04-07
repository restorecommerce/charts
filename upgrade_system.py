#!/usr/bin/env python3

# Upgrades system charts to highest available semver-compatible versions of our charts

from os import path
from urllib.parse import urlparse
from yaml import load, dump

try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

import dxf
import semver

# The repository to check for upgrades
OCI_REPOSITORY = "oci://ghcr.io/restorecommerce/charts"

upgraded = False
chart_path = path.join("charts/system/", "Chart.yaml")

with open(chart_path, "r") as f:
    chart = load(f, Loader)

for i, dep in enumerate(chart["dependencies"]):
    if "repository" in dep and dep["repository"] == OCI_REPOSITORY:
        oci_repo_url = dep["repository"][len("oci://"):]
        image = path.join(oci_repo_url, dep["name"])
        
        current_version = dep["version"]
        print(f"Checking {image} for updates, current version {current_version}")

        # urlparse requires a scheme
        url = urlparse("https://" + image)

        try:
            dxf_obj = dxf.DXF(url.netloc, url.path[1:])
            # ghcr.io requires auth
            dxf_obj.authenticate(actions=['pull'])
            aliases = dxf_obj.list_aliases()
            
            highest_semver = current_version
            for alias in aliases:
                # OCI image tags can contain things that are not valid semver
                # e.g. `latest`
                if semver.VersionInfo.is_valid(alias):
                    if semver.compare(highest_semver, alias) == -1:
                        highest_semver = alias

            if current_version == highest_semver:
                print(f"{image} is up to date at version {current_version}")
                continue
            
            print(f"Upgrading {dep['name']} from {current_version} to {highest_semver}")
            upgraded = True
            chart["dependencies"][i]["version"] = highest_semver

        except Exception as err:
            print(f"Error checking {image}: {err}")
            print("Skipping...")

if upgraded:
    new_version = str(semver.VersionInfo.parse(chart["version"]).bump_patch())
    chart["version"] = new_version
    print(f"System chart version bumped to {new_version}")
    with open(chart_path, "w") as f:
        dump(chart, f, Dumper)
else:
    print("All dependencies are up to date.")
    