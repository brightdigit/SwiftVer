#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  cd ..
  swift package generate-xcodeproj
else
  # What to do in Ubunutu
  echo "test"
fi