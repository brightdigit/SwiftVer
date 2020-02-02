#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  brew update
  brew bundle
else
  echo "test"
  # What to do in Ubunutu
fi