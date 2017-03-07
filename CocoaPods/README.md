# General

**How to use CommonCrypto in a Swift-Framework:**
- https://github.com/CocoaPods/CocoaPods/issues/5271#issuecomment-217817281
- http://stackoverflow.com/questions/25248598/importing-commoncrypto-in-a-swift-framework/37125785#37125785  (`Cocoapods with modulemap approach` is used)

**ATTENTION!**
- the modulemaps uses absolute path (/Applications/Xcode.app)
- bytes cannot be used as `Local Development Pod` (for more information see links above)
