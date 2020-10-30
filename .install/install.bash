#!/usr/bin/env bash
set -e

# Pre-requisites
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31m$1 not installed!\e[39m"
    exit 1
  }
}
command_exists "brew"
command_exists "git"
xcode_tools_installed() {
  xcode-select -p > /dev/null 2>&1 || {
    echo -e "\e[31mXcode command line tools not installed!\e[39m"
    exit 2
  }
}
xcode_tools_installed

install() {
  echo -e "\e[36mRunning $(basename $1) install script\e[39m"
  "${1}install.bash" || {
    echo -e "\e[31mRunning $(basename $1) install script failed!\e[39m"
    exit $?
  }
  echo -e "\e[32mRunning $(basename $1) install script complete!\e[39m"
}

# Install Homebrew first
install "$HOME/.install/brew/"

# Execute all other install scripts
for dir in "$HOME"/.install/*/; do
  if [[ "$(basename $dir)" != "brew" ]]; then
    install "$dir"
  fi
done
