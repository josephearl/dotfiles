#!/usr/bin/env bash
set -e

# Execute all install scripts
for dir in "${HOME}"/.install/*/; do
  echo -e "\e[36mRunning $(basename ${dir}) install script\e[39m"
  "${dir}install.bash" || {
    echo -e "\e[31mRunning $(basename ${dir}) install script failed!\e[39m"
    exit $?
  }
  echo -e "\e[32mRunning $(basename ${dir}) install script complete!\e[39m"
done
