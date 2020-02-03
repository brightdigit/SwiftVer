#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  pod lib lint
  swiftformat --lint . && swiftlint
  swift test  --enable-code-coverage
  xcrun llvm-cov export -format="lcov" .build/debug/swiftverPackageTests.xctest/Contents/MacOS/swiftverPackageTests
  -instr-profile .build/debug/codecov/default.profdata > info.lcov
  bash <(curl https://codecov.io/bash) -F travis -F macOS -n $TRAVIS_JOB_NUMBER-$TRAVIS_OS_NAME
  pod install --project-directory=Example
  ./Example/Shared/autorevision/autorevision.sh -t swift > Example/Source/VCS.swift
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "iOS Example"  ONLY_ACTIVE_ARCH=NO  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "tvOS Example"  ONLY_ACTIVE_ARCH=NO   CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "macOS Example"  ONLY_ACTIVE_ARCH=NO CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
else
  # What to do in Ubunutu
  export PATH="${PWD}/swift-5.1.3-RELEASE-ubuntu18.04/usr/bin:$PATH"
  swift build 
  swift test --enable-code-coverage
  llvm-cov export -format="lcov" .build/x86_64-unknown-linux/debug/SwiftVerPackageTests.xctest -instr-profile .build/debug/codecov/default.profdata > info.lcov
  bash <(curl https://codecov.io/bash) -F travis -F bionic -n $TRAVIS_JOB_NUMBER-$TRAVIS_OS_NAME
fi
