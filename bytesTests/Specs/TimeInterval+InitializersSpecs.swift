//
//  TimeInterval+InitializersSpecs.swift
//  bytesTests
//
//  Created by Pascal Stüdlein on 28.11.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class TimeIntervalInitalizerSpec: QuickSpec {
    override func spec() {
        describe("init(days:)") {
            it("with 4 should return 345600") {
                let lhs = TimeInterval(days: 4)
                let rhs = 345600 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 2.5 should return 216000") {
                let lhs = TimeInterval(days: 2.5)
                let rhs = 216000 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 0 should return 0") {
                let lhs = TimeInterval(days: 0)
                let rhs = 0 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with -3 should return -259200") {
                let lhs = TimeInterval(days: -3)
                let rhs = -259200 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
        }
        
        describe("init(hours:)") {
            it("with 4 should return 14400") {
                let lhs = TimeInterval(hours: 4)
                let rhs = 14400 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 2.5 should return 9000") {
                let lhs = TimeInterval(hours: 2.5)
                let rhs = 9000 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 0 should return 0") {
                let lhs = TimeInterval(hours: 0)
                let rhs = 0 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with -3 should return -10800") {
                let lhs = TimeInterval(hours: -3)
                let rhs = -10800 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
        }
        
        describe("init(minutes:)") {
            it("with 4 should return 240") {
                let lhs = TimeInterval(minutes: 4)
                let rhs = 240 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 2.5 should return 150") {
                let lhs = TimeInterval(minutes: 2.5)
                let rhs = 150 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with 0 should return 0") {
                let lhs = TimeInterval(minutes: 0)
                let rhs = 0 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
            it("with -3 should return -180") {
                let lhs = TimeInterval(minutes: -3)
                let rhs = -180 as TimeInterval
                expect(lhs).to(equal(rhs))
            }
        }
    }
}

