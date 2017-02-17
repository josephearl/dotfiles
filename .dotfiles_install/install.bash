#!/usr/bin/env bash
set -e

# Init checks
# Check if a command exists
command_exists() {
  if [! hash $1 2>/dev/null]; then
    echo "$1 not installed, please install $1 and re-run dotfiles install"
    exit 1
  fi
}
# Git must be installed
command_exists "git"
# Homebrew must be installed
command_exists "brew"

# Homebrew taps and casks
# Make sure Homebrew is up to date and OK
brew update
brew doctor
# Install everything in the Brewfile
brew bundle

# NPM - installed by Homebrew
# https://github.com/rafaelrinaldi/hn-cli
npm install -g @rafaelrinaldi/hn-cli
# http://ionicframework.com/getting-started/
npm install -g cordova ionic@beta
# http://ionicframework.com/docs/ionic-cli-faq/#ios-emulate
npm install -g ios-sim ios-deploy
# https://github.com/angular/angular-cli
npm install -g angular-cli
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

# RubyGems - installed by HomeBrew
# Update system version
gem update --system
# http://bundler.io
gem install bundler

# SDKMAN!
curl -s "https://get.sdkman.io" | bash
. $HOME/.bashrc
# http://groovy-lang.org
sdk install groovy
# http://www.scala-lang.org
sdk install scala
# https://kotlinlang.org
sdk install kotlin
# http://gradle.org
sdk install gradle
# http://maven.apache.org
sdk install maven
# http://ant.apache.org
sdk install ant
# # http://gradle.org
sdk install sbt
