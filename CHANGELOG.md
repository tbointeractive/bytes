# Changelog

## unreleased
* **feature** Added function to shuffle an Array/NSArray.
* **feature** The AsyncViewController will now take over the rightBarButtonItems from its contentViewController 
* **bugfix** Exposed UIColor hex convenience initializer
* **bugfix** UIViewController addChildViewController extension will now call didMoveToParentViewController in the correct order

## 0.2
* **feature** Added AsyncViewController
* **feature** Added RemoteSettings to fetch and store remote configurations
* **feature** Added SemanticVersion support
* **feature** ByteCountFormatter extension with default count styles
* **feature** DateComponentsFormatter extension with multiple display types for a time
* **feature** Moved UIApplication and UIDevice extensions into their own structs
* **feature** NumberFormatter extension with fractionDigits
* **feature** String extension for generating hashes of a string
* **feature** UIViewController extension for adding an child view with constrained edges
* **feature** URL extension for handling query parameter

## 0.1
* **feature** UIColor extension that allows initializing from a hex string
* **feature** UIColor extension that allows setting color-channel values
* **feature** IconFont; A class that helps handling icon fonts.
* **feature** DateFormatter extension with formatters for common tasks
* **feature** UIApplication extension for several properties such as `bundleDisplayName` and `bundleVersion`
* **feature** UIDevice extension with `platformName`, `humanReadablePlatformName` and `osVersion`
* **feature** UIImage extension to rotate and flip an existing image
* **feature** DiscardTouchView aka MCHammerView
* **feature** UIView extension for easier constraint manipulation
* **feature** `ArrayTableViewDatasource` for simple UITableView datasources
