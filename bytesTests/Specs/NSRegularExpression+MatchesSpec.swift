//
//  NSRegularExpression+MatchesSpec .swift
//  bytesTests
//
//  Created by Cornelius Horstmann on 27.07.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class NSRegularExpressionMatchesSpec: QuickSpec {
    override func spec() {
        describe("matches") {
            it("should return true if the expression matches the whole string") {
                let expression = try! NSRegularExpression(pattern: ".*", options: [])
                expect(expression.matches("random_test_spec")) == true
            }
            it("should return false if the expression only partially matches the string") {
                let expression = try! NSRegularExpression(pattern: "\\w+", options: [])
                expect(expression.matches("this is a string with not only letters")) == false
            }
            it("should return false if the expression doesn't match the string at all") {
                let expression = try! NSRegularExpression(pattern: "\\d+", options: [])
                expect(expression.matches("this is a string without numbers")) == false
            }
        }
        describe("partiallyMatches") {
            it("should return true if the expression matches the whole string") {
                let expression = try! NSRegularExpression(pattern: ".*", options: [])
                expect(expression.partiallyMatches("random_test_spec")) == true
            }
            it("should return true if the expression only partially matches the string") {
                let expression = try! NSRegularExpression(pattern: "\\w+", options: [])
                expect(expression.partiallyMatches("this is a string with not only letters")) == true
            }
            it("should return false if the expression doesn't match the string at all") {
                let expression = try! NSRegularExpression(pattern: "\\d+", options: [])
                expect(expression.partiallyMatches("this is a string without numbers")) == false
            }
        }
    }
}
