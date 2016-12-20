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
    ///
    /// - Parameter dictionary: The dictionary which keys and values to be added.
    public mutating func merge(_ dictionary:Dictionary) {
        for (key, value) in dictionary{
            self[key] = value
        }
    }
}
