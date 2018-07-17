//
//  NSRegularExpression+Matches.swift
//  bytes
//
//  Created by Cornelius Horstmann on 13.07.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension NSRegularExpression {
    
    public func matches(_ string: String) -> Bool {
        let fullStringRange = NSRange(string.startIndex..., in: string)
        let foundMatches = matches(in: string, options: [], range: fullStringRange)
        guard let match = foundMatches.first else { return false }
        return match.range == fullStringRange
    }
    
    public func partiallyMatches(_ string: String) -> Bool {
        let fullStringRange = NSRange(string.startIndex..., in: string)
        let foundMatches = matches(in: string, options: [], range: fullStringRange)
        return foundMatches.first != nil
    }
    
    public func matches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> [NSTextCheckingResult] {
        let range = NSRange(string.startIndex..., in: string)
        return matches(in: string, options: options, range: range)
    }
    
}

extension String {
    
    public func matches(_ expression: NSRegularExpression) -> Bool {
        return expression.matches(self)
    }
    
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
