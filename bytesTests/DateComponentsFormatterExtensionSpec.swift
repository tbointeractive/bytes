//
//  DateComponentsFormatterExtensionSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class DateComponentsFormatterExtensionSpec: QuickSpec {
    override func spec() {
        describe("positionalTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.positionalTime
                expect(formatter.string(from: 61*60+1)).to(equal("1:01"))
            }
        }
        describe("detailedPositionalTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.detailedPositionalTime
                expect(formatter.string(from: 61*60+1)).to(equal("1:01:01"))
            }
        }
        describe("shortPositionalTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.shortPositionalTime
                expect(formatter.string(from: 61*60+1)).to(equal("61:01"))
            }
        }
        describe("abbreviatedTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.abbreviatedTime
                expect(formatter.string(from: 61*60+1)).to(equal("1h 1m"))
            }
        }
        describe("detailedAbbreviatedTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.detailedAbbreviatedTime
                expect(formatter.string(from: 61*60+1)).to(equal("1h 1m 1s"))
            }
        }
        describe("shortAbbreviatedTime") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.shortAbbreviatedTime
                expect(formatter.string(from: 61*60+1)).to(equal("61m 1s"))
            }
        }
        
        describe("abbreviatedDay") {
            it("should format a timeinterval in the right format") {
                let formatter = DateComponentsFormatter.abbreviatedDay
                expect(formatter.string(from: 60*60*24+60)).to(equal("1d"))
            }
        }
    }
}
