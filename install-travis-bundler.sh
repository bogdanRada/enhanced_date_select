#!/usr/bin/env bash

# set -o errexit
# set -o pipefail
# set -o nounset

rails_version="$(basename "${BUNDLE_GEMFILE:="$(pwd)/Gemfile"}" .gemfile | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')"

echo "Trying to compare rails ${rails_version:="1"} with 5.1"

if (( $(echo "${rails_version%.*} >= 5.1" |bc -l) )); then
   echo "Installing Bundler v2"
   gem uninstall -v '< 2.0' -i "$(rvm gemdir)"@global -ax bundler --force || true
   gem install bundler -v '2.0.1'
   export MY_BUNDLER_VERSION="_2.0.1_"
else
   echo "Installing Bundler v1"
   gem uninstall -v '>= 2' -i "$(rvm gemdir)"@global -ax bundler --force  || true
   gem install bundler -v '1.17.3'
   export MY_BUNDLER_VERSION="_1.17.3_"
fi

unset rails_version
