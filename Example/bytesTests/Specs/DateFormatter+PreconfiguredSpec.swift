//
//  DateFormatterExtensionsSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class DateFormatterExtensionsSpec: QuickSpec {
    let referenceDate = Date(timeIntervalSince1970: 1478019664)
    
    override func spec() {
        describe("httpDateFormatter") {
            it("should be correct date string for reference date") {
                let dateFormatter = DateFormatter.httpDateFormatter
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "Tue, 01 Nov 2016 17:01:04 GMT"
            }
        }
        
        describe("iso8601Formatter") {
            it("should be correct date string for reference date") {
                let dateFormatter = DateFormatter.iso8601Formatter
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "2016-11-01T17:01:04Z"
            }
            it("should be correct date string for reference date with CET timeZone") {
                let dateFormatter = DateFormatter.iso8601Formatter
                dateFormatter.timeZone = TimeZone(abbreviation:"CET")
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "2016-11-01T18:01:04+01:00"
            }
        }
        
        describe("dayAndMonth(forLocale:)") {
            it("should be correct for german locale") {
                let dateFormatter = DateFormatter.dayAndMonth(forLocale: Locale(identifier: "de_DE"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "01.11."
            }
            it("should be correct for englisch locale") {
                let dateFormatter = DateFormatter.dayAndMonth(forLocale: Locale(identifier: "en_US"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "11/01"
            }
            it("should be correct for french locale") {
                let dateFormatter = DateFormatter.dayAndMonth(forLocale: Locale(identifier: "fr_FR"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "01/11"
            }
        }
        
        describe("dayAndMonth") {
            it("should be correct for current locale") {
                let dateFormatter = DateFormatter.dayAndMonth
                let dateString = dateFormatter.string(for:self.referenceDate)
                let compareFormatter = DateFormatter.dayAndMonth(forLocale: Locale.current)
                let compareString = compareFormatter.string(for:self.referenceDate)
                expect(dateString) == compareString
            }
        }
        
        describe("weekday(forLocale:)") {
            it("should be correct for german locale") {
                let dateFormatter = DateFormatter.weekday(forLocale: Locale(identifier: "de_DE"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "Dienstag"
            }
            it("should be correct for englisch locale") {
                let dateFormatter = DateFormatter.weekday(forLocale: Locale(identifier: "en_US"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "Tuesday"
            }
            it("should be correct for french locale") {
                let dateFormatter = DateFormatter.weekday(forLocale: Locale(identifier: "fr_FR"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "mardi"
            }
        }
        
        describe("weekday") {
            it("should be correct for current locale") {
                let dateFormatter = DateFormatter.weekday
                let dateString = dateFormatter.string(for:self.referenceDate)
                let compareFormatter = DateFormatter.weekday(forLocale: Locale.current)
                let compareString = compareFormatter.string(for:self.referenceDate)
                expect(dateString) == compareString
            }
        }
        
        describe("weekdayShort(forLocale:)") {
            it("should be correct for german locale") {
                let dateFormatter = DateFormatter.weekdayShort(forLocale: Locale(identifier: "de_DE"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                if #available(iOS 9, *) {
                    expect(dateString) == "Di"
                } else {
                    expect(dateString) == "Di."
                }
            }
            it("should be correct for englisch locale") {
                let dateFormatter = DateFormatter.weekdayShort(forLocale: Locale(identifier: "en_US"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "Tue"
            }
            it("should be correct for french locale") {
                let dateFormatter = DateFormatter.weekdayShort(forLocale: Locale(identifier: "fr_FR"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "mar."
            }
        }
        
        describe("weekdayShort") {
            it("should be correct for current locale") {
                let dateFormatter = DateFormatter.weekdayShort
                let dateString = dateFormatter.string(for:self.referenceDate)
                let compareFormatter = DateFormatter.weekdayShort(forLocale: Locale.current)
                let compareString = compareFormatter.string(for:self.referenceDate)
                expect(dateString) == compareString
            }
        }
        
        describe("weekdaySingleLetter(forLocale:)") {
            it("should be correct for german locale") {
                let dateFormatter = DateFormatter.weekdaySingleLetter(forLocale: Locale(identifier: "de_DE"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "D"
            }
            it("should be correct for englisch locale") {
                let dateFormatter = DateFormatter.weekdaySingleLetter(forLocale: Locale(identifier: "en_US"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "T"
            }
            it("should be correct for french locale") {
                let dateFormatter = DateFormatter.weekdaySingleLetter(forLocale: Locale(identifier: "fr_FR"))
                let dateString = dateFormatter.string(for:self.referenceDate)
                expect(dateString) == "M"
            }
        }
        
        describe("weekdaySingleLetter") {
            it("should be correct for current locale") {
                let dateFormatter = DateFormatter.weekdaySingleLetter
                let dateString = dateFormatter.string(for:self.referenceDate)
                let compareFormatter = DateFormatter.weekdaySingleLetter(forLocale: Locale.current)
                let compareString = compareFormatter.string(for:self.referenceDate)
                expect(dateString) == compareString
            }
        }
        
        describe("shortTime") {
            it("should be correct time string for the reference date") {
                let dateFormatter = DateFormatter.shortTime
                let dateString = dateFormatter.string(for:self.referenceDate)
                let compareFormatter = DateFormatter.shortTime(forLocale: Locale.current)
                let compareString = compareFormatter.string(for:self.referenceDate)
                expect(dateString) == compareString
            }
        }
    }
}
