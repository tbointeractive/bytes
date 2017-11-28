# bytes

[![Build Status](https://travis-ci.org/tbointeractive/bytes.svg?branch=develop)](https://travis-ci.org/tbointeractive/bytes)
<!-- [![coverage report](http://git.tbointeractive.com/chorstmann/bytes/badges/develop/coverage.svg)](http://git.tbointeractive.com/chorstmann/bytes/commits/develop) -->

**bytes** is a set of tools to cover many all-day tasks in iOS development.

## Get started
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

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
