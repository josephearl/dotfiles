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
test -d "$ASDF_DATA_DIR/plugins/nodejs" || {
  asdf plugin add nodejs
}
test -d "$ASDF_DATA_DIR/plugins/python" || {
  asdf plugin add python
}
test -d "$ASDF_DATA_DIR/plugins/ruby" || {
  asdf plugin add ruby
}

asdf install dotnet-core 3.1.402
asdf global dotnet-core 3.1.402

asdf install golang 1.15.2
asdf global golang 1.15.2

asdf install java adoptopenjdk-11.0.8+10
asdf global java adoptopenjdk-11.0.8+10

bash -c '$ASDF_DATA_DIR/plugins/nodejs/bin/import-release-team-keyring'
asdf install nodejs 12.18.4
asdf global nodejs 12.18.4

asdf install python 3.8.6
asdf install python 2.7.18
asdf global python 3.8.6 2.7.18

asdf install ruby 2.7.1
asdf global ruby 2.7.1
