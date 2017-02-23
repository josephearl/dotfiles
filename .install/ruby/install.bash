#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# rbenv - install by Homebrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
command_exists "rbenv"
# Ruby
ruby_version="2.4.0"
rbenv_install() {
  rbenv versions | grep "$1" 2>/dev/null || rbenv install "$1"
}
rbenv_install "${ruby_version}"
rbenv global "${ruby_version}"

# RubyGems
command_exists "gem"
# Update system version
gem update --system
# http://bundler.io
gem install bundler
