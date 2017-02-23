#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# Source bashrc to get the brew command alias
shopt -s expand_aliases
. "${HOME}/.bashrc"
# Make sure Homebrew is up to date and OK
brew update
brew doctor
# Install everything in the Brewfile
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
(cd "$DIR" && brew bundle)
