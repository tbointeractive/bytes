//
//  Int+TimeIntervalSpecs.swift
//  bytesTests
//
//  Created by Cornelius Horstmann on 29.10.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class DoubleTimeIntervalSpecs: QuickSpec {
    override func spec() {
        describe("seconds") {
            it("it returns the double as TimeInterval in secods") {
                expect(5.seconds) == TimeInterval(exactly: 5)
            }
        }
        describe("minutes") {
            it("it returns the double as TimeInterval in minutes") {
                expect(5.minutes) == TimeInterval(exactly: 5 * 60)
            }
        }
        describe("hours") {
            it("it returns the double as TimeInterval in hours") {
                expect(5.hours) == TimeInterval(exactly: 5 * 60 * 60)
            }
        }
        describe("days") {
            it("it returns the double as TimeInterval in days") {
                expect(5.days) == TimeInterval(exactly: 5 * 60 * 60 * 24)
            }
        }
        describe("weeks") {
            it("it returns the double as TimeInterval in weeks") {
                expect(5.weeks) == TimeInterval(exactly: 5 * 60 * 60 * 24 * 7)
            }
        }
        describe("arithmetic") {
            it("can perform addition on generated TimeIntervals") {
                let oneWeekAndOneDayInSeconds = 60 * 60 * 24 + 60 * 60 * 24 * 7
                expect(1.day + 1.week) == TimeInterval(exactly: oneWeekAndOneDayInSeconds)
            }
        }
    }
}
