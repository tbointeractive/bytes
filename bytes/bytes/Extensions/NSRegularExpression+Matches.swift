//
//  NSRegularExpression+Matches.swift
//  bytes
//
//  Created by Cornelius Horstmann on 13.07.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    /// Checks if the complete string matches the regular expression.
    ///
    /// - Parameter string: The string to match against.
    /// - Returns: True if the complete string is the first match.
    public func matches(_ string: String) -> Bool {
        let fullStringRange = NSRange(string.startIndex..., in: string)
        let foundMatches = matches(in: string, options: [], range: fullStringRange)
        guard let match = foundMatches.first else { return false }
        return match.range == fullStringRange
    }
    
    /// Checks if there is any match in the string.
    ///
    /// - Parameter string: The string to match against.
    /// - Returns: True if any match is found.
    public func partiallyMatches(_ string: String) -> Bool {
        let fullStringRange = NSRange(string.startIndex..., in: string)
        let foundMatches = matches(in: string, options: [], range: fullStringRange)
        return foundMatches.first != nil
    }
    
    /// Returns all matches in the given string.
    ///
    /// - Parameters:
    ///   - string: The string to search for matches.
    ///   - options: The options to check matches with. Default is no options.
    /// - Returns: All found matches in the complete string.
    public func matches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> [NSTextCheckingResult] {
        let range = NSRange(string.startIndex..., in: string)
        return matches(in: string, options: options, range: range)
    }
    
}

extension String {
    
    /// Checks if the complete string matches the regular expression.
    ///
    /// - Parameter expression: The expression to match against.
    /// - Returns: True if the complete string is the first match.
    public func matches(_ expression: NSRegularExpression) -> Bool {
        return expression.matches(self)
    }
    
    /// Checks if there is any match in the string.
    ///
    /// - Parameter expression: The expression to match against.
    /// - Returns: True if any match is found.
    public func contains(_ expression: NSRegularExpression) -> Bool {
        return expression.partiallyMatches(self)
    }
    
    public mutating func replaceOcurrences(of expression: NSRegularExpression, with template: String) {
        let modified = replacingOcurrences(of: expression, with: template)
        self = modified
    }

    public func replacingOcurrences(of expression: NSRegularExpression, with template: String) -> String {
        let range = NSRange(self.startIndex..., in: self)
        return expression.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
    }
}
