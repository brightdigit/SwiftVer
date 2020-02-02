#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  brew update
  brew bundle
else
  #sudo apt install clang llvm
  #sudo apt-get install clang libicu-dev llvm
  #sudo eval "$(curl -sL https://swiftenv.fuller.li/install.sh)"
  # What to do in Ubunutu
  #sudo apt-get install clang libicu-dev
  wget -q -O - https://swift.org/keys/all-keys.asc | \
  gpg --import -
  gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
  wget https://swift.org/builds/swift-5.1.3-release/ubuntu1804/swift-5.1.3-RELEASE/swift-5.1.3-RELEASE-ubuntu18.04.tar.gz.sig
  wget https://swift.org/builds/swift-5.1.3-release/ubuntu1804/swift-5.1.3-RELEASE/swift-5.1.3-RELEASE-ubuntu18.04.tar.gz
  gpg --verify swift-5.1.3-RELEASE-ubuntu18.04.tar.gz.sig
  tar xzf swift-5.1.3-RELEASE-ubuntu18.04.tar.gz
  ls ${PWD}/swift-5.1.3-RELEASE-ubuntu18.04/usr/bin
  export PATH="${PWD}/swift-5.1.3-RELEASE-ubuntu18.04/usr/bin:${PATH}"
fi