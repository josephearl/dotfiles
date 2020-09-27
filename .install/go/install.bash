#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# goenv - installed by HomeBrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
command_exists "goenv"
# go
go_version="1.15.2"
goenv_install() {
  goenv versions | grep "$1" 2>/dev/null || goenv install "$1"
}
goenv_install "${go_version}"
goenv global "${go_version}"
