//
//  NSAttributedString.swift
//  bytes
//
//  Created by Cornelius Horstmann on 25.08.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension Collection where Iterator.Element == NSAttributedString, IndexDistance == Int {
    /// Returns a new NSAttributedString by concatenating the elements of the collection,
    /// adding the given separator between each element.
    ///
    /// - Parameter separator: A string to insert between each of the elements. The default separator is an empty string.
    /// - Returns: The concatenated string.
    public func joined(separator: NSAttributedString = NSAttributedString(string: "")) -> NSAttributedString {
        let initial = NSMutableAttributedString()
        
        for (index, element) in self.enumerated() {
            if index > 0 {
                initial.append(separator)
            }
            initial.append(element)
        }
        
        return initial
    }
}
