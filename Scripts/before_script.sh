#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  
  swift package generate-xcodeproj
else
  # What to do in Ubunutu
  echo "test"
fi