#!/bin/bash

set -euo pipefail

install_hab() {
  type curl >/dev/null 2>&1 || { echo >&2 "curl is required for installation of habitat, but was not found. Exiting."; exit 1; }
  curl -O https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh
  chmod +x install.sh
  ./install.sh -v 0.90.6
}

install_deps() {
  hab pkg path core/cacerts >/dev/null 2>&1 || hab pkg install core/cacerts
  hab pkg path core/hab-sup >/dev/null 2>&1 || hab pkg install core/hab-sup/0.90.6
}

type hab > /dev/null 2>&1 || install_hab
install_deps
