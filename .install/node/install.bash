#!/usr/bin/env bash
set -e
err_report() {
  echo -e "\e[31mError on line $1 in file $0\e[39m"
}
trap 'err_report $LINENO' ERR

# nvm - installed by Homebrew
command_exists() {
  hash "$1" 2>/dev/null || { 
    echo -e "\e[31mPre-requisite $1 not installed\e[39m"
    exit 1
  }
}
# Source bashrc to get the nvm command
. "${HOME}/.bashrc"
command_exists "nvm"
# Node
node_version="7.6.0"
nvm_install() {
  nvm ls "$1" | grep "$1" 2>/dev/null || nvm install "$1"
}
nvm_install "${node_version}"
nvm alias default "${node_version}"
nvm use "${node_version}"

# NPM
command_exists "npm"
# https://github.com/rafaelrinaldi/hn-cli
npm install -g @rafaelrinaldi/hn-cli
# http://ionicframework.com/getting-started/
npm install -g cordova ionic@beta
# http://ionicframework.com/docs/ionic-cli-faq/#ios-emulate
npm install -g ios-sim ios-deploy
# https://github.com/angular/angular-cli
npm install -g @angular/cli
# https://www.npmjs.com/package/react-cli
npm install -g react-cli react
# https://www.npmjs.com/package/react-native-cli
npm install -g react-native-cli
# https://github.com/gruntjs/grunt-cli
npm install -g grunt-cli
# https://github.com/gulpjs/gulp-cli
npm install -g gulp-cli
# https://github.com/karma-runner/karma-cli
npm install -g karma-cli
