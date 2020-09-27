#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# SDKMAN!
# Source bashrc to get the sdk command
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${HOME}/.bashrc"
hash "sdk" 2>/dev/null || {
  tmp_dir="$(mktemp -d)"
  cp "${SDKMAN_DIR}/etc/"* "${tmp_dir}/"
  rm -rf "${SDKMAN_DIR}"
  curl -s "https://get.sdkman.io" | bash
  cp "${tmp_dir}/"* "${SDKMAN_DIR}/etc/"
  rm -rf "${tmp_dir}"
}
source "${SDKMAN_DIR}/bin/sdkman-init.sh"
sdk install java
