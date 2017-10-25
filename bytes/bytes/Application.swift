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
    
    /// The bundle name of your app i.e. "com.my-company.my-app"
    public let name: String?
    
    /// The name of your app as displayed on the homescreen i.e. "My App"
    public let displayName: String?
    
    /// The bundle version aka build number as String i.e. "149"
    public let buildVersion: String?
    
    /// The app version as String i.e. "1.0.1"
    public let version: String?
    
    /// The app version as a `SemanticVersion`.
    public var semanticVersion: SemanticVersion? {
        get {
            guard let version = version else { return nil }
            return SemanticVersion(version)
        }
    }
    
    public init(name: String?, displayName: String?, buildVersion: String?, version: String?) {
        self.name = name
        self.displayName = displayName
        self.buildVersion = buildVersion
        self.version = version
    }
    
    /// Initializes the `Application` with data from the bundles infoDicionary.
    public init(bundle: Bundle) {
        let name = bundle.infoDictionary?["CFBundleName"] as? String
        let displayName = bundle.infoDictionary?["CFBundleDisplayName"] as? String
        let buildVersion = bundle.infoDictionary?["CFBundleVersion"] as? String
        let version = bundle.infoDictionary?["CFBundleShortVersionString"] as? String
        self.init(name: name, displayName: displayName, buildVersion: buildVersion, version: version)
    }
}
