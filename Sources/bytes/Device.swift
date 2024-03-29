//
//  Device.swift
//  bytes
//
//  Created by Cornelius Horstmann on 04.01.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import Foundation

/// The Device Struct holds important information about a Device.
public struct Device {
    
    /// The platform name of the device i.e. "iPhone1,1" or "iPad3,6"
    public let platform: String
    
    /// The version number of the OS as String i.e. "1.2" or "9.4"
    public let osVersion: String
    
    public init(platform: String, osVersion: String) {
        self.platform = platform
        self.osVersion = osVersion
    }
    
    /// The current device.
    static public let current = Device.currentDevice()
    
    static private func currentDevice() -> Device {
        var size = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0,  count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        let platform = String(cString: machine)
        let osVersion = UIDevice.current.systemVersion
        return Device(platform: platform, osVersion: osVersion)
    }
    
    /// A human readable version of the platform name i.e. "iPhone 6 Plus" or "iPad Air 2 (WiFi)"
    /// Or nil in case no human readable name was found.
    public var humanReadablePlatform: String? {
        switch platform {
        // iPhone
        case "iPhone1,1":    return "iPhone 1G"
        case "iPhone1,2":    return "iPhone 3G"
        case "iPhone2,1":    return "iPhone 3GS"
        case "iPhone3,1":    return "iPhone 4"
        case "iPhone3,2":    return "iPhone 4 (Revision A)"
        case "iPhone3,3":    return "Verizon iPhone 4"
        case "iPhone4,1":    return "iPhone 4S"
        case "iPhone5,1":    return "iPhone 5 (GSM)"
        case "iPhone5,2":    return "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":    return "iPhone 5c (GSM)"
        case "iPhone5,4":    return "iPhone 5c (Global)"
        case "iPhone6,1":    return "iPhone 5s (GSM)"
        case "iPhone6,2":    return "iPhone 5s (Global)"
        case "iPhone7,1":    return "iPhone 6 Plus"
        case "iPhone7,2":    return "iPhone 6"
        case "iPhone8,1":    return "iPhone 6s"
        case "iPhone8,2":    return "iPhone 6s Plus"
        case "iPhone8,4":    return "iPhone SE"
        case "iPhone9,1":    return "iPhone 7 (GSM+CDMA)"
        case "iPhone9,2":    return "iPhone 7 Plus (GSM+CDMA)"
        case "iPhone9,3":    return "iPhone 7 (Global)"
        case "iPhone9,4":    return "iPhone 7 Plus (Global)"
        case "iPhone10,1":    return "iPhone 8 (GSM+CDMA)"
        case "iPhone10,2":    return "iPhone 8 Plus (GSM+CDMA)"
        case "iPhone10,3":    return "iPhone X (GSM+CDMA)"
        case "iPhone10,4":    return "iPhone 8 (Global)"
        case "iPhone10,5":    return "iPhone 8 Plus (Global)"
        case "iPhone10,6":    return "iPhone X (Global)"
        case "iPhone11,2":    return "iPhone XS"
        case "iPhone11,4":    return "iPhone XS Max (China)"
        case "iPhone11,6":    return "iPhone XS Max"
        case "iPhone11,8":    return "iPhone XR"
        case "iPhone12,1":    return "iPhone 11"
        case "iPhone12,3":    return "iPhone 11 Pro"
        case "iPhone12,5":    return "iPhone 11 Pro Max"
            
        // iPod
        case "iPod1,1":      return "iPod Touch 1st Gen"
        case "iPod2,1":      return "iPod Touch 2nd Gen"
        case "iPod3,1":      return "iPod Touch 3rd Gen"
        case "iPod4,1":      return "iPod Touch 4th Gen"
        case "iPod5,1":      return "iPod Touch 5th Gen"
        case "iPod7,1":      return "iPod Touch 6th Gen"
        case "iPod9,1":      return "iPod Touch 7th Gen"
            
        // iPad
        case "iPad1,1":      return "iPad 1"
        case "iPad2,1":      return "iPad 2 (WiFi)"
        case "iPad2,2":      return "iPad 2 (GSM)"
        case "iPad2,3":      return "iPad 2 (CDMA)"
        case "iPad2,4":      return "iPad 2 (WiFi)"
        case "iPad2,5":      return "iPad Mini 1 (WiFi)"
        case "iPad2,6":      return "iPad Mini 1 (GSM)"
        case "iPad2,7":      return "iPad Mini 1 (GSM+CDMA)"
        case "iPad3,1":      return "iPad 3 (WiFi)"
        case "iPad3,2":      return "iPad 3 (GSM+CDMA)"
        case "iPad3,3":      return "iPad 3 (GSM)"
        case "iPad3,4":      return "iPad 4 (WiFi)"
        case "iPad3,5":      return "iPad 4 (GSM)"
        case "iPad3,6":      return "iPad 4 (GSM+CDMA)"
        case "iPad4,1":      return "iPad Air 1 (WiFi)"
        case "iPad4,2":      return "iPad Air 1 (Cellular)"
        case "iPad4,3":      return "iPad Air"
        case "iPad4,4":      return "iPad Mini 2 (WiFi)"
        case "iPad4,5":      return "iPad Mini 2 (Cellular)"
        case "iPad4,6":      return "iPad Mini 2 (Rev)"
        case "iPad4,7":      return "iPad Mini 3 (WiFi)"
        case "iPad4,8":      return "iPad Mini 3 (A1600)"
        case "iPad4,9":      return "iPad Mini 3 (A1601)"
        case "iPad5,1":      return "iPad Mini 4 (WiFi)"
        case "iPad5,2":      return "iPad Mini 4 (Cellular)"
        case "iPad5,3":      return "iPad Air 2 (WiFi)"
        case "iPad5,4":      return "iPad Air 2 (Cellular)"
        case "iPad6,3":      return "iPad Pro 9.7 (WiFi)"
        case "iPad6,4":      return "iPad Pro 9.7 (Cellular)"
        case "iPad6,7":      return "iPad Pro 12.9 (WiFi)"
        case "iPad6,8":      return "iPad Pro 12.9 (Cellular)"
        case "iPad6,11":     return "iPad (2017)"
        case "iPad6,12":     return "iPad (2017)"
        case "iPad7,1":      return "iPad Pro 12.9 2nd generation (WiFi)"
        case "iPad7,2":      return "iPad Pro 12.9 2nd generation (Cellular)"
        case "iPad7,3":      return "iPad Pro 10.5 (WiFi)"
        case "iPad7,4":      return "iPad Pro 10.5 (Cellular)"
        case "iPad7,5":      return "iPad 6th Gen (WiFi)"
        case "iPad7,6":      return "iPad 6th Gen (WiFi+Cellular)"
        case "iPad8,1":      return "iPad Pro 3rd Gen (11 inch, WiFi)"
        case "iPad8,2":      return "iPad Pro 3rd Gen (11 inch, 1TB, WiFi)"
        case "iPad8,3":      return "iPad Pro 3rd Gen (11 inch, WiFi+Cellular)"
        case "iPad8,4":      return "iPad Pro 3rd Gen (11 inch, 1TB, WiFi+Cellular)"
        case "iPad8,5":      return "iPad Pro 3rd Gen (12.9 inch, WiFi)"
        case "iPad8,6":      return "iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi)"
        case "iPad8,7":      return "iPad Pro 3rd Gen (12.9 inch, WiFi+Cellular)"
        case "iPad8,8":      return "iPad Pro 3rd Gen (12.9 inch, 1TB, WiFi+Cellular)"
        case "iPad11,1":     return "iPad mini 5th Gen (WiFi)"
        case "iPad11,2":     return "iPad mini 5th Gen"
        case "iPad11,3":     return "iPad Air 3rd Gen (WiFi)"
        case "iPad11,4":     return "iPad Air 3rd Gen"
            
        case "i386":         return "Simulator"
        case "x86_64":       return "Simulator"
            
        case "Watch1,1":     return "Apple Watch 38mm case"
        case "Watch1,2":     return "Apple Watch 42mm case"
        case "Watch2,6":     return "Apple Watch Series 1 38mm case"
        case "Watch2,7":     return "Apple Watch Series 1 42mm case"
        case "Watch2,3":     return "Apple Watch Series 2 38mm case"
        case "Watch2,4":     return "Apple Watch Series 2 42mm case"
        case "Watch3,1":     return "Apple Watch Series 3 38mm case (GPS+Cellular)"
        case "Watch3,2":     return "Apple Watch Series 3 42mm case (GPS+Cellular)"
        case "Watch3,3":     return "Apple Watch Series 3 38mm case (GPS)"
        case "Watch3,4":     return "Apple Watch Series 3 42mm case (GPS)"
        case "Watch4,1":     return "Apple Watch Series 4 40mm case (GPS)"
        case "Watch4,2":     return "Apple Watch Series 4 44mm case (GPS)"
        case "Watch4,3":     return "Apple Watch Series 4 40mm case (GPS+Cellular)"
        case "Watch4,4":     return "Apple Watch Series 4 44mm case (GPS+Cellular)"
        case "Watch5,1":     return "Apple Watch Series 5 40mm case (GPS)"
        case "Watch5,2":     return "Apple Watch Series 5 44mm case (GPS)"
        case "Watch5,3":     return "Apple Watch Series 5 40mm case (GPS+Cellular)"
        case "Watch5,4":     return "Apple Watch Series 5 44mm case (GPS+Cellular)"
            
        default: return nil
        }
    }
}
#endif
