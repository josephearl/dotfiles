#!/usr/bin/env bash
set -e

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
