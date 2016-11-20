//
//  URLExtensions.swift
//  bytes
//
//  Created by Cornelius Horstmann on 20.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension URL {
    
    /// Returns a new url where new URLQueryItem are added.
    ///
    /// - Parameter query: A dictionary representing query items to add.
    /// - Returns: A new URL.
    func adding(query items: [String:String]) -> URL? {
        let newQueryItems = URLQueryItem.items(items)
        let existingQueryItems = self.queryItems().filter({ !items.keys.contains($0.name) })
        return setting(existingQueryItems + newQueryItems)
    }
    
    /// Returns a new url where all URLQueryItem are replaced.
    ///
    /// - Parameter query: A dictionary representing query items to set.
    /// - Returns: A new URL.
    func setting(query items: [String:String]) -> URL? {
        return setting(URLQueryItem.items(items))
    }
    
    /// Calculates and returns an array of URLQueryItems.
    ///
    /// - Returns: An Array of URLQueryItems.
    func queryItems() -> [URLQueryItem] {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return []
        }
        return components.queryItems ?? []
    }
    
    /// Returns a new url where all URLQueryItem are replaced.
    ///
    /// - Parameter items: An Array of the new URLQueryItems.
    /// - Returns: A new URL.
    private func setting(_ items: [URLQueryItem]) -> URL? {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return nil
        }
        components.queryItems = items
        return components.url
    }
}

private extension URLQueryItem {
    
    /// Creates URLQueryItems from a dictionary
    ///
    /// - Parameter dictionary: A flat dictionary with just keys and values to create the url with.
    /// - Returns: An Array of new URLQueryItems.
    static func items(_ dictionary: [String:String]) -> [URLQueryItem] {
        return dictionary.map({ (key, value) in URLQueryItem(name: key, value: value) })
    }
}
