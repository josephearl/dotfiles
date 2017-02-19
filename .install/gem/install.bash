#!/usr/bin/env bash
set -e

# RubyGems - installed by HomeBrew
# Update system version
gem update --system
# http://bundler.io
gem install bundler
