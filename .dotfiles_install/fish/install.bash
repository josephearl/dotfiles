#!/usr/bin/env bash
set -e

if ! grep -q "/usr/local/bin/fish" /etc/shells; then
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
  chsh -s "/usr/local/bin/fish"
fi
