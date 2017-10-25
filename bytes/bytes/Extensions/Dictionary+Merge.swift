//
//  Dictionary+Merge.swift
//  bytes
//
//  Created by Thorsten Stark on 20.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension Dictionary {
    
    /// Adds all keys and values from dictionary.
    /// - note: All values in self with keys being in both dictionaries will be replaced with the values in dictionary.
    /// - note: The dictionary retains (not copies) the values from the passed dictionary.
    ///
    /// - Parameter dictionary: The dictionary which keys and values to be added.
    public mutating func merge(_ dictionary:Dictionary) {
        for (key, value) in dictionary{
            self[key] = value
        }
    }
    
    /// Returns a new dictionary with the keys and values form both dictionaries.
    /// - note: All values in self with keys being in both dictionaries will be replaced with the values in dictionary.
    /// - note: The new dictionary retains (not copies) the values from both original dictionaries.
    ///
    /// - Parameter dictionary: The dictionary which keys and values to be added.
    /// - Returns: A new dictionary
    public func merged(_ dictionary: Dictionary) -> Dictionary {
        var newDictionary = Dictionary()
        newDictionary.merge(self)
        newDictionary.merge(dictionary)
        return newDictionary
    }
}
