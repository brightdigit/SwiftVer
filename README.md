![header](https://raw.githubusercontent.com/brightdigit/swiftver/master/Assets/Images/Logo.png)

# SwiftVer

[![Twitter](https://img.shields.io/badge/Twitter-@BrightDigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/swiftver.svg)](https://codecov.io/gh/brightdigit/swiftver)
![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/SwiftVer)
[![codebeat badge](https://codebeat.co/badges/f8cf9120-d08a-4e13-b4cb-198e0dfd02e3)](https://codebeat.co/projects/github-com-brightdigit-swiftver-master)
![Swift](https://github.com/brightdigit/SwiftVer/workflows/Swift/badge.svg)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/SwiftVer)
![GitHub](https://img.shields.io/github/license/brightdigit/SwiftVer)
[![Travis](https://img.shields.io/travis/brightdigit/swiftver.svg)](https://travis-ci.org/brightdigit/swiftver)
[![Beerpay](https://img.shields.io/beerpay/brightdigit/swiftver.svg?maxAge=2592000)](https://beerpay.io/brightdigit/swiftver)
[![Analytics](https://ga-beacon.appspot.com/UA-33667276-5/brightdigit/swiftver?flat&useReferer)](https://github.com/igrigorik/ga-beacon)
[![Version](https://img.shields.io/cocoapods/v/SwiftVer.svg?style=flat)](https://cocoapods.org/pods/SwiftVer)
[![License](https://img.shields.io/cocoapods/l/SwiftVer.svg?style=flat)](https://cocoapods.org/pods/SwiftVer)
[![Platform](https://img.shields.io/cocoapods/p/SwiftVer.svg?style=flat)](https://cocoapods.org/pods/SwiftVer)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Manage versioning in MacOS, iOS, watchOS, and tvOS projects by parsing your bundle and revision metadata from your VCS repository.

![screenshoot](https://raw.githubusercontent.com/brightdigit/swiftver/master/Assets/Images/sample-image.png)

## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Requirements](#requirements)
- [Installation](#installation)
  - [CocoaPods](#cocoapods)
  - [Carthage](#carthage)
- [Usage](#usage)
  - [Parsing the Version from a Bundle](#parsing-the-version-from-a-bundle)
  - [Integrating Version Control Info with Autorevision](#integrating-version-control-info-with-autorevision)
  - [Using a StageBuildDictionary to parse Stage](#using-a-stagebuilddictionary-to-parse-stage)
- [Documentation](/docs/README.md)
- [Author](#author)
- [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Requirements

- XCode 8.0
- macOS 10.10+, iOS 8.1+, watchOS 2.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SwiftVer into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'SwiftVer'
```

Then, run the following command:

```bash
$ pod install
```


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftVer into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "brightdigit/SwiftVer" ~> 2.0.0
```

Run `carthage update` to build the framework and drag the built `SwiftVer.framework` into your Xcode project.


## Usage

### Parsing the Version from a Bundle

The `Version` bundle initializer takes in a bundle and failable. If your Bundle does to contain a valid version string in the format of `major.minor` or `major.minor.patch`, the initializer will fail.

```swift
guard let version = Version(bundle: Bundle.main) else {
	// invalid version format
}

```

#### Valid
![xcode screenshot version 1.0.1](https://raw.githubusercontent.com/brightdigit/swiftver/master/Assets/Images/version_format_xcode_1.0.1.png)

#### Valid
![xcode screenshot version 1.0](https://raw.githubusercontent.com/brightdigit/swiftver/master/Assets/Images/version_format_xcode_1.0.png)

#### Invalid
![xcode screenshot version 1](https://raw.githubusercontent.com/brightdigit/swiftver/master/Assets/Images/version_format_xcode_1.png)

### Integrating Version Control Info with [Autorevision](https://autorevision.github.io)

You can revision metadata from your VCS repository using [Autorevision](https://autorevision.github.io).

1. Add the bash script from [Autorevision](https://autorevision.github.io).

2. Add a Run Script build phase to your project.

``` base
"${SRCROOT}/autorevision.sh" -t <format> >${SRCROOT}/framework/autorevision.<format>
```

3. Include the output in your bundle.

4. Parse the output and call the `VersionControlInfo` initializer.

``` swift
public struct VersionControlInfo {  
	public init(type: String,
              baseName: String,
              uuid: Hash?,
              number: Int,
              date: String,
              branch: String,
              tag: String?,
              tick: Int?,
              extra: String?,
              hash: String,

              isWorkingCopyModified: Bool)
}
```

### Using a StageBuildDictionary to parse Stage

In version 2.0.0, you can parse the stage based on a StageBuildDictionary. The StageBuildDictionary is a plist which maps the Semantic Versions to Stages and their minimum build number.

#### Plist where the Build Number Resets at Each Semantic Version (iOS)
![intra build stage dictionary plist screenshot ](/Assets/Images/stagebuilddictionary-intra.png)

#### Plist where the Build Number does not Reset at Each Semantic Version (Sparkle-compatible macOS)
![global build stage dictionary plist screenshot ](/Assets/Images/stagebuilddictionary-global.png)

To create the dictionary pass it to the following method:

``` swift
public enum Stage {
  public static func dictionary(fromPlistAtURL url: URL) -> StageBuildDictionaryProtocol?
}
```

## Documentation

[Documentation Here](/docs/README.md)

## Author

Leo G Dion, [BrightDigit, LLC](http://www.brightdigit.com)

## License

SwiftVer is available under the MIT license. See the LICENSE file for more info.
