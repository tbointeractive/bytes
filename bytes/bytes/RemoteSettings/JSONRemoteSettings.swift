//
//  JSONRemoteSettings.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

/// A remote setting Class that expects the data to be in a valid JSON format.
/// It offers two specialized update methods that serve a dictionary or an array.
/// This class is designed to be overridden, especially the 
/// `update(_ data: [AnyHashable: Any]) throws` and `update(_ data: [Any]) throws` methods.
open class JSONRemoteSettings: RemoteSettings {
    
    /// This method expects a Data object, parses it and uses the
    /// `update(_ data: [AnyHashable: Any])` and `update(_ data: [Any])`
    /// methods to continue updating.
    ///
    /// - Parameter data: The data object update from.
    /// - Throws: Throws a RemoteSettings.UpdateError.UnableToParseData if the data is not valid JSON.
    open override func update(_ data: Data) throws {
        let object = try JSONSerialization.jsonObject(with: data, options: [])
        if let dictionary = object as? [AnyHashable: Any] {
            try update(dictionary)
        } else if let array = object as? [Any] {
            try update(array)
        } else {
            throw RemoteSettings.UpdateError.UnableToParseData
        }
    }
    
    /// Default implementation throws a `RemoteSettings.UpdateError.UnableToParseData` error.
    /// - Warning: This method should be overridden by subclasses to parse the data, and provide it to the application.
    open func update(_ data: [AnyHashable: Any]) throws {
        throw RemoteSettings.UpdateError.UnableToParseData
    }
    
    /// Default implementation throws a `RemoteSettings.UpdateError.UnableToParseData` error.
    /// - Warning: This method should be overridden by subclasses to parse the data, and provide it to the application.
    open func update(_ data: [Any]) throws {
        throw RemoteSettings.UpdateError.UnableToParseData
    }
    
}
