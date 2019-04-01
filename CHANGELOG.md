# Changelog

## 1.1
* **feature** Migrated to Swift 4.2
* **feature** Added Double+TimeInterval extension
* **feature** Added a function to initialize a UIView from a nib
* **feature** Exposing the UIImage(from: UIColor) extension
* **feature** Added a new UIImage+Color extension implementing generating an image with just one plain color
* **improvement** Added more devices to Device
* **improvement** Setting the AsyncViewController views backgroundcolor to be white per default
* **changed** Deprecating and renaming the bool.random function here in bytes

## 0.9
* **feature** Release of v1.0

## 0.9
* **feature** Added a function to render a UIView into a UIImage.
* **feature** Added a function do calculate the difference between two dictionaries.
* **feature** Added function to get a queryItem from a url where the name matches a string.
* **feature** Added random property to every Collection and NSArray.
* **feature** Added function to shuffle an Array/NSArray.
* **improvement** The constraint helper now returns a discardableResult that is the constriaint that has been set.
* **improvement** The AsyncViewController will now take over the rightBarButtonItems from its contentViewController
* **improvement** The AsyncViewController will now cancel the current loading if it is deallocated.
* **improvement** Added support for iOS 8.2
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
