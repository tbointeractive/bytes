# bytes

[![Build Status](https://travis-ci.org/tbointeractive/bytes.svg?branch=develop)](https://travis-ci.org/tbointeractive/bytes)
![GitHub](https://img.shields.io/github/license/tbointeractive/bytes)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/tbointeractive/bytes)
![Swift Version](https://img.shields.io/badge/Swift-5.0-orange.svg)

**bytes** is a set of Swift tools to cover many all-day tasks in iOS development.

## Get started

### Install via Swift Package Manager (SPM)
As of version 1.3 bytes also supports SPM. To use it, add this repo to your packages in Xcode:
```
https://github.com/tbointeractive/bytes
```

### Install via [CocoaPods](http://cocoapods.org/)
Add the bytes Pod
```ruby
pod 'bytes'
```

**The CommonCrypto Dilema:**  
To provide little hashing helpers such as `public var md5: String` in [String+Hashes.swift](https://github.com/tbointeractive/bytes/blob/develop/bytes/bytes/Extensions/String%2BHashes.swift), bytes uses the static C Library CommonCrypto. During the pod install we include CommonCrypto by modulemaps (CocoaPods/) in the framework. Those modulemaps have strong references to the default installation path of Xcode (*/Applications/Xcode.app*).

## Usage
Please read the documentation to find out about all the existing bytes.

## Developing

### Implementing your own byte
Please start a discussion about a byte before implementing one of your own. We love to discuss new ideas and get a concept straigt early on.

### Testing
Please ensure proper testing of all your code whilst not blindly watching the coverage percentage.

### Documentation
Please add proper documentation to your code (Xcode Editor -> Structure -> Add Documentation). We use [jazzy](https://github.com/realm/jazzy) to generate the docset. Use the `jazzy` command to generate it on your own machine.

### Release
The version of this library is set in different ways for Cocoapods and SPM:
* SPM: uses the commit tag, which must be a valid [semantic version](https://semver.org) (i.e. 1.2.3) [see documentation](https://developer.apple.com/documentation/xcode/publishing-a-swift-package-with-xcode)
* Cocoapods: uses the commit tag to find the correct sources, but the version itself is defined in the podspec file

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
