#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

if ! grep -q "/usr/local/bin/fish" /etc/shells; then
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi
chsh -s "/usr/local/bin/fish"
