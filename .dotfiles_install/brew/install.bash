#!/usr/bin/env bash
set -e

# Homebrew taps and casks
# Make sure Homebrew is up to date and OK
brew update
brew doctor
# Install everything in the Brewfile
brew bundle
