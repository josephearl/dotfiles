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
mkdir -p "$HOME/.rbenv"
command_exists "rbenv"
# Ruby
ruby_version="2.7.1"
rbenv_install() {
  rbenv versions | grep "$1" 2>/dev/null || rbenv install "$1"
}
rbenv_install "${ruby_version}"
eval "$(rbenv init -)"
rbenv global "${ruby_version}"
rbenv shell "${ruby_version}"

# RubyGems
command_exists "gem"
# Update
gem update
# http://bundler.io
gem install bundler
