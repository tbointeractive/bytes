//
//  UIApplicationExtensions.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIApplication {
    
    /// The name of your app as displayed on the homescreen i.e. "My App"
    static let bundleDisplayName: String? = {
            return Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String
    }()
    
    /// The bundle name of your app i.e. "com.my-company.my-app"
    static let bundleName: String? = {
            return Bundle.main.infoDictionary?["CFBundleName"] as? String
    }()
    
    /// The bundle version aka build number as String i.e. "149"
    static let bundleVersion: String? = {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }()
    
    /// The app version as String i.e. "1.0.1"
    static let bundleShortVersion: String? = {
            return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }()
}
