#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# Homebrew taps and casks
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31m$1 not installed!\e[39m"
    exit 1
  }
}
command_exists "git"
# Source bashrc to get the brew command alias
. "${HOME}/.bashrc"
command_exists "brew"
# Make sure Homebrew is up to date and OK
brew update
brew doctor
# Install everything in the Brewfile
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
(cd "$DIR" && brew bundle)
