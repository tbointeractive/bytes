//
//  Dictionary+Diff.swift
//  bytes
//
//  Created by Cornelius Horstmann on 02.08.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension Dictionary where Key: Equatable, Value: Equatable {
    
    /// Calculates the difference to get from a dictionary to another dictionary.
    /// The calculated diff:
    /// - contains a key-value pair if the value changed
    /// - doesn't contain a key-value pair if the value did not change
    /// - contains a key-value pair if it was added in the destination
    /// - contains a nil as value if the key was removed in the destination
    ///
    /// - Parameter destination: The dictionary this diff should reach.
    /// - Returns: The diff comparing the source to the destination.
    public func diff(to destination: [Key:Value]) -> [Key:Value?] {
        var diff: [Key:Value?] = [:]
        for (sourceKey, sourceValue) in self {
            if sourceValue != destination[sourceKey] {
                diff[sourceKey] = destination[sourceKey]
            }
        }
        for (destinationKey, destinationValue) in destination {
            if self[destinationKey] == nil {
                diff[destinationKey] = destinationValue
            }
        }
        return diff
    }
}
