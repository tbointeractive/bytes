//
//  String+Random.swift
//  bytes
//
//  Created by Thorsten Stark on 23.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension String {
    
    /// Returns a string with the given length containing characters in a random order
    ///
    /// - Note: The given characters are only a quantity from which to pick randomly. Not all characters are said appear in the final string.
    ///
    /// - Parameters:
    ///   - characters: Array of characters that can occur in the random string
    ///   - length: Number of characters the random string should have
    /// - Returns: A String with random order characters
    public static func random(with characters: [Character], length: Int) -> String {
        var randomString = ""
        let range:Range = 0..<characters.count
        for _ in 0..<length {
            let randomIndex = Int.random(in: range)
            let randomChar = characters[randomIndex]
            randomString.append(randomChar)
        }
        return randomString
    }
}
