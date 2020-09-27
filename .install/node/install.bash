#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# nvm - installed by Homebrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
# Source bashrc to get the nvm command
. "${HOME}/.bashrc"
command_exists "nvm"
# Node
node_version="--lts"
nvm_install() {
  nvm install "$1"
}
nvm_install "${node_version}"
nvm alias default "lts/*"
nvm use "${node_version}"

# NPM
command_exists "npm"
