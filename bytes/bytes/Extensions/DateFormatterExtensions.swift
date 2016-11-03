//
//  DateFormatterExtensions.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    /// A date formatter to use for dates in http requests i.e. Tue, 01 Nov 2016 17:01:04 GMT
    /// The default time zone is GMT
    static public let httpDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss z"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }()
    
    /// A date formatter conforming to the ISO 8601 standard using this format: yyyy-MM-dd'T'HH:mm:ssZZZZZ
    /// On iOS 10+ it is a ISO8601DateFormatter; on earlier versions it's a DateFormatter
    /// The default time zone is GMT
    static public let iso8601Formatter: Formatter = {
        if #available(iOS 10.0, *) {
            return ISO8601DateFormatter()
        } else {
            let dateFormatter = DateFormatter()
            // This is to macht the ISO8601DateFormatter default format and timeZone
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            return dateFormatter
        }
    }()
    
    /// A date formatter for localized month and day representation i.e. "23.06." or "06/23"
    /// with current locale
    static public let dayAndMonth: DateFormatter = {
        return DateFormatter.dayAndMonth(forLocale: Locale.current)
    }()
    
    /// A date formatter for localized weekday representation i.e. "Monday" or "Montag"
    /// with current locale
    static public let weekday: DateFormatter = {
        return DateFormatter.weekday(forLocale: Locale.current)
    }()
    
    /// A date formatter for localized abbreviated weekday representation i.e. "Mo" or "Tue"
    /// with current locale
    static public let weekdayShort: DateFormatter = {
        return DateFormatter.weekdayShort(forLocale: Locale.current)
    }()
    
    /// A date formatter for a localized first letter of a weekday i.e. "M" or "T"
    /// with current locale
    static public let weekdaySingleLetter: DateFormatter = {
        return DateFormatter.weekdaySingleLetter(forLocale: Locale.current)
    }()
    
    /// A date formatter for localized month and day representation i.e. "23.06." or "06/23"
    ///
    /// - Parameter locale: A Locale for the desired localization
    /// - Returns: A new DateFormatter
    static public func dayAndMonth(forLocale locale: Locale) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.setLocalizedDateFormatFromTemplate("MMdd")
        return dateFormatter
    }
    
    /// A date formatter for localized weekday representation i.e. "Monday" or "Montag"
    ///
    /// - Parameter locale: A Locale for the desired localization
    /// - Returns: A new DateFormatter
    static public func weekday(forLocale locale: Locale) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEE")
        return dateFormatter
    }
    
    /// A date formatter for localized abbreviated weekday representation i.e. "Mo" or "Tue"
    ///
    /// - Parameter locale: A Locale for the desired localization
    /// - Returns: A new DateFormatter
    static public func weekdayShort(forLocale locale: Locale) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
        return dateFormatter
    }
    
    /// A date formatter for a localized first letter of a weekday i.e. "M" or "T"
    ///
    /// - Parameter locale: A Locale for the desired localization
    /// - Returns: A new DateFormatter
    static public func weekdaySingleLetter(forLocale locale: Locale) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = locale
        dateFormatter.setLocalizedDateFormatFromTemplate("EEEEE")
        return dateFormatter
    }
}
