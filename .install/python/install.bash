#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# pyenv - installed by HomeBrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
# Source bashrc to get the pyenv shell command working
. "${HOME}/.bashrc"
mkdir -p "$PYENV_DIR"
command_exists "pyenv"
# Python 2 and 3
python2_version="2.7.18"
python3_version="3.8.5"
pyenv_install() {
  pyenv versions | grep "$1" 2>/dev/null || pyenv install "$1"
}
pyenv_install "${python2_version}"
pyenv_install "${python3_version}"
# Default Python 3
pyenv global "${python3_version}"
