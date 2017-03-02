//
//  DateComponentsFormatterExtensions.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension DateComponentsFormatter {
    
    /// A DateComponentsFormatter that formats a duration in a positional format
    /// displaying hours and minutes.
    /// A TimeInterval of `3661` will be formatted as `1:01`.
    static public let positionalTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        return formatter
    }()
    
    /// A DateComponentsFormatter that formats a duration in a positional format
    /// displaying hours, minutes and seconds.
    /// A TimeInterval of `3661` will be formatted as `1:01:01`.
    static public let detailedPositionalTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        return formatter
    }()
    
    /// A DateComponentsFormatter that formats a duration in a positional format
    /// displaying minutes and seconds.
    /// A TimeInterval of `3661` will be formatted as `61:01`.
    static public let shortPositionalTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        return formatter
    }()
    
    // MARK: abbreviated
    
    /// A DateComponentsFormatter that formats a duration in a abbreviated format
    /// displaying hours and minutes.
    /// A TimeInterval of `3661` will be formatted as `1h 1m`.
    static public let abbreviatedTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    /// A DateComponentsFormatter that formats a duration in a abbreviated format
    /// displaying hours, minutes and seconds.
    /// A TimeInterval of `3661` will be formatted as `1h 1m 1s`.
    static public let detailedAbbreviatedTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    
    /// A DateComponentsFormatter that formats a duration in a abbreviated format
    /// displaying minutes and seconds.
    /// A TimeInterval of `3661` will be formatted as `61m 1s`.
    static public let shortAbbreviatedTime: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
    
    /// A DateComponentsFormatter that formats a duration in a abbreviated format
    /// displaying just the days.
    /// A TimeInterval of `86460` will be formatted as `1d`.
    static public let abbreviatedDay: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.day]
        formatter.unitsStyle = .abbreviated
        return formatter
    }()
}
