#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  brew update
  brew bundle
else
  apt install clang llvm
  eval "$(curl -sL https://swiftenv.fuller.li/install.sh)"
  # What to do in Ubunutu
fi