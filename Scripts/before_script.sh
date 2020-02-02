#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
  cd ..
  swift package generate-xcodeproj
else
fi