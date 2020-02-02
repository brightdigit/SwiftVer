#!/bin/bash

if [ $TRAVIS_OS_NAME = 'osx' ]; then
  cd ..
  brew update
  brew bundle
else
  # What to do in Ubunutu
fi