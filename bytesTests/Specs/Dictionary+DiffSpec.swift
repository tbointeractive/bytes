//
//  Dictionary+DiffSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 02.08.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class DictionaryDiffSpec: QuickSpec {
    override func spec() {
        describe("diff") {
            it("should not contain values that weren't changed") {
                let source = ["a":"b"]
                let diff = source.diff(to: ["a":"b"])
                expect(diff["a"]).to(beNil())
            }
            it("should return nil for values that aren't set in the destination") {
                let source = ["a":"b"]
                let diff = source.diff(to: [:])
                expect(diff["a"]!).to(beNil())
            }
            it("should contain values for the destination if they changed comparing to the source") {
                let source = ["a":"b"]
                let diff = source.diff(to: ["a":"c"])
                expect(diff["a"]!) == "c"
            }
            it("should contain values for the destination if they weren't existing in the source") {
                let source: [String:String] = [:]
                let diff = source.diff(to: ["a":"c"])
                expect(diff["a"]!) == "c"
            }
        }
    }
}
