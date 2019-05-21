//
//  Application.swift
//  bytes
//
//  Created by Cornelius Horstmann on 03.01.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

/// The Application struct holds important information about an Application.
public struct Application {
    /// The main Application.
    static public let main = Application(bundle: Bundle.main)
    
    /// The bundle name of your app (CFBundleName)
    public let name: String?
    
    /// The name of your app as displayed on the homescreen (CFBundleDisplayName)  i.e. "My App"
    public let displayName: String?
    
    /// The bundle version aka build number as String (CFBundleName) i.e. "149"
    public let buildVersion: String?
    
    /// The app version as String (CFBundleShortVersionString) i.e. "1.0.1"
    public let version: String?
    
    /// The bundle identifier of your app (CFBundleIdentifier) i.e. "com.my-company.my-app"
    public let bundleIdentifier: String?
    
    /// The app version as a `SemanticVersion`.
    public var semanticVersion: SemanticVersion? {
        get {
            guard let version = version else { return nil }
            return SemanticVersion(version)
        }
    }
    
    public init(name: String?, displayName: String?, buildVersion: String?, version: String?, bundleIdentifier: String?) {
        self.name = name
        self.displayName = displayName
        self.buildVersion = buildVersion
        self.version = version
        self.bundleIdentifier = bundleIdentifier
    }
    
    /// Initializes the `Application` with data from the bundles infoDicionary.
    public init(bundle: Bundle) {
        let name = bundle.infoDictionary?["CFBundleName"] as? String
        let displayName = bundle.infoDictionary?["CFBundleDisplayName"] as? String
        let buildVersion = bundle.infoDictionary?["CFBundleVersion"] as? String
        let version = bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        let bundleIdentifier = bundle.infoDictionary?["CFBundleIdentifier"] as? String
        self.init(name: name, displayName: displayName, buildVersion: buildVersion, version: version, bundleIdentifier: bundleIdentifier)
    }
}
