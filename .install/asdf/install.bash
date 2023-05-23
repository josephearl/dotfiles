#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# asdf - installed by Homebrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
command_exists "asdf"
source "$HOME/.bashrc"
test -d "$ASDF_DATA_DIR/plugins/dotnet-core" || {
  asdf plugin add dotnet-core
}
test -d "$ASDF_DATA_DIR/plugins/golang" || {
  asdf plugin add golang
}
test -d "$ASDF_DATA_DIR/plugins/java" || {
  asdf plugin add java
}
test -d "$ASDF_DATA_DIR/plugins/groovy" || {
  asdf plugin-add groovy https://github.com/weibemoura/asdf-groovy.git
}
test -d "$ASDF_DATA_DIR/plugins/nodejs" || {
  asdf plugin add nodejs
}
test -d "$ASDF_DATA_DIR/plugins/python" || {
  asdf plugin add python
}
test -d "$ASDF_DATA_DIR/plugins/ruby" || {
  asdf plugin add ruby
}

(cd "$HOME"; asdf install)
