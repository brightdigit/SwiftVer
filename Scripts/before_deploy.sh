#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  cd ..
  carthage build --no-skip-current
  carthage archive $FRAMEWORK_NAME
else
  # What to do in Ubunutu
  echo "test"
fi