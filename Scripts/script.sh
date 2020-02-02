#!/bin/bash

if [[ $TRAVIS_OS_NAME = 'osx' ]]; then
  pod lib lint
  swiftformat --lint . && swiftlint
  swift test  --enable-code-coverage
  xcrun llvm-cov export -format="lcov" .build/debug/swiftverPackageTests.xctest/Contents/MacOS/swiftverPackageTests
  -instr-profile .build/debug/codecov/default.profdata > info.lcov
  bash <(curl https://codecov.io/bash) -F travis-ci
  pod install --project-directory=Example
  ./Example/Shared/autorevision/autorevision.sh -t swift > Example/Source/VCS.swift
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "iOS Example"  ONLY_ACTIVE_ARCH=NO  CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "tvOS Example"  ONLY_ACTIVE_ARCH=NO   CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
  xcodebuild -workspace Example/Examples.xcworkspace -scheme "macOS Example"  ONLY_ACTIVE_ARCH=NO CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO  CODE_SIGNING_ALLOWED=NO
else
  # What to do in Ubunutu
  swift build -v
  swift test -v --enable-code-coverage
  llvm-cov export -format="lcov" .build/debug/swiftverPackageTests.xctest/Contents/MacOS/swiftverPackageTests -instr-profile .build/debug/codecov/default.profdata > info.lcov
  bash <(curl https://codecov.io/bash) -F travis -F bionic
fi