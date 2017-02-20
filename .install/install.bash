#!/usr/bin/env bash
set -e

# Init checks
# Check if a command exists
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo "$1 not installed, please install $1 and re-run dotfiles install"
    exit 1
  }
}

# Git must be installed
command_exists "git"
# Homebrew must be installed
command_exists "brew"

for dir in "${HOME}"/.install/*/; do
  . "${dir}install.bash"
done
