#!/usr/bin/env python3

# Bakes all charts and places them in the dependencies of the system chart

from os import path
from yaml import load

try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader

import subprocess

with open(path.join("charts/system/", "Chart.yaml"), "r") as f:
    chart = load(f, Loader)
    for i, dep in enumerate(chart["dependencies"]):
        if "repository" in dep and dep["repository"] == "https://restorecommerce.github.io/charts/":
            correct = subprocess.run(['helm', 'package', '--version', dep["version"], '-d', './charts/system/charts/', './charts/{}'.format(dep["name"])], check=True, text=True)
