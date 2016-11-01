//
//  UIApplicationExtensions.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIApplication {
    
    /// Returns name of your app as displayd on the homescreen i.e. "My App"
    static var bundleDisplayName: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
        }
    }
    
    /// Returns the bundle name of your app i.e. "com.my-company.my-app"
    static var bundleName: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleName"] as? String
        }
    }
    
    /// Returns the bundle version aka build number as String i.e. "149"
    static var bundleVersion: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        }
    }
    
    /// Returns the app version as String i.e. "1.0.1"
    static var bundleShortVersion: String? {
        get {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        }
    }
    
}
