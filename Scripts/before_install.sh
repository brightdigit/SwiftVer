#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  brew update
  brew bundle
else
  #sudo apt install clang llvm
  #sudo apt-get install clang libicu-dev llvm
  sudo eval "$(curl -sL https://swiftenv.fuller.li/install.sh)"
  # What to do in Ubunutu
fi