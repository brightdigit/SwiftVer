#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  pwd
  brew update
  brew bundle
else
  echo "test"
  # What to do in Ubunutu
fi