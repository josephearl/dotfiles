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

# Execute all install scripts
for dir in "${HOME}"/.install/*/; do
  echo -e "\e[36mRunning $(basename ${dir}) install script\e[39m"
  "${dir}install.bash" || {
    echo -e "\e[31mRunning $(basename ${dir}) install script failed!\e[39m"
    exit $?
  }
  echo -e "\e[32mRunning $(basename ${dir}) install script complete!\e[39m"
done
