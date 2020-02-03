#!/bin/bash

curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter
chmod +x ./cc-test-reporter
./cc-test-reporter before-build

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  swift package generate-xcodeproj
else
  # What to do in Ubunutu
  echo "test"
fi