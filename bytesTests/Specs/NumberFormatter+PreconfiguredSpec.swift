//
//  NumberFormatterExtensionsSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class NumberFormatterExtensionsSpec: QuickSpec {
    override func spec() {
        describe("decimalSingleDigit") {
            it("should return a Numberformatter with maximumFractionDigits 1") {
                expect(NumberFormatter.decimalSingleDigit).toNot(beNil())
                expect(NumberFormatter.decimalSingleDigit.maximumFractionDigits).to(equal(1))
            }
            it("should always return the same object") {
                expect(NumberFormatter.decimalSingleDigit).to(equal(NumberFormatter.decimalSingleDigit))
            }
            it("should format a number with just one fraction digit") {
                let formatter = NumberFormatter.decimalSingleDigit
                expect(formatter.string(from: NSNumber(floatLiteral: 12.1234))).to(equal("12.1"))
            }
            it("should format a number with always a leading digit") {
                let formatter = NumberFormatter.decimalSingleDigit
                expect(formatter.string(from: NSNumber(floatLiteral: 0.1234))).to(equal("0.1"))
            }
        }
        describe("decimalDoubleDigit") {
            it("should return a Numberformatter with maximumFractionDigits 2") {
                expect(NumberFormatter.decimalDoubleDigit).toNot(beNil())
                expect(NumberFormatter.decimalDoubleDigit.maximumFractionDigits).to(equal(2))
            }
            it("should always return the same object") {
                expect(NumberFormatter.decimalDoubleDigit).to(equal(NumberFormatter.decimalDoubleDigit))
            }
            it("should format a number with two fraction digits") {
                let formatter = NumberFormatter.decimalDoubleDigit
                expect(formatter.string(from: NSNumber(floatLiteral: 12.1234))).to(equal("12.12"))
            }
            it("should format a number with always a leading digit") {
                let formatter = NumberFormatter.decimalDoubleDigit
                expect(formatter.string(from: NSNumber(floatLiteral: 0.1234))).to(equal("0.12"))
            }
        }
    }
}
