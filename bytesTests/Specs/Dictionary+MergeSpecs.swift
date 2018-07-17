//
//  Dictionary+MergeSpecs.swift
//  bytes
//
//  Created by Thorsten Stark on 20.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class DictionaryMergeSpecs: QuickSpec {
    override func spec() {
        describe("merge") {
            it("should add every key-value pair of the second dictionary when no keys overlap") {
                var dictA = ["a":"b"]
                let dictB = ["c":"d"]
                dictA.merge(dictB)
                expect(dictA.count) == 2
                expect(dictA["a"]).to(equal("b"))
                expect(dictA["c"]).to(equal("d"))
            }
            it("should override every key-value pair when the key already exists") {
                var dictA = ["a":"b"]
                let dictB = ["a":"e"]
                dictA.merge(dictB)
                expect(dictA.count) == 1
                expect(dictA["a"]).to(equal("e"))
            }
            it("should change nothing if second dictionary is empty") {
                var dictA = ["a":"b"]
                let dictB: [String:String] = [:]
                dictA.merge(dictB)
                expect(dictA.count) == 1
                expect(dictA["a"]).to(equal("b"))
            }
            it("should change all items if dictionary is empty") {
                var dictA: [String:String] = [:]
                let dictB = ["c":"d"]
                dictA.merge(dictB)
                expect(dictA.count) == 1
                expect(dictA["c"]).to(equal("d"))
            }
            it("should work with strings and numbers as values") {
                var dictA:[AnyHashable:Any] = ["a":"b"]
                let dictB:[AnyHashable:Any] = ["c":3]
                dictA.merge(dictB)
                expect(dictA.count) == 2
                expect(dictA["c"] as? Int).to(equal(3))
            }
            it("should work with strings and numbers as keys") {
                var dictA:[AnyHashable:Any] = ["a":"b"]
                let dictB:[AnyHashable:Any] = [3:"c"]
                dictA.merge(dictB)
                expect(dictA.count) == 2
                expect(dictA[3] as? String).to(equal("c"))
            }
            it("should work with different types for keys ans values") {
                var dictA:[AnyHashable:Any] = ["a":"b", 2: [1, 2], 3:true]
                let dictB:[AnyHashable:Any] = [3:"c", "a":42.1, "key":["dict":"value"]]
                dictA.merge(dictB)
                expect(dictA.count) == 4
                expect(dictA[3] as? String).to(equal("c"))
                expect(dictA["a"] as? Double).to(equal(42.1))
            }
        }
        describe("merged") {
            it("should add all key-value pairs from both dictionaries to a new one") {
                let dictA = ["a":"b"]
                let dictB = ["c":"d"]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 2
                expect(dictC["a"]).to(equal("b"))
                expect(dictC["c"]).to(equal("d"))
            }
            it("should override every key-value pair when the key already exists in the first dictionary") {
                let dictA = ["a":"b"]
                let dictB = ["a":"e"]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 1
                expect(dictC["a"]).to(equal("e"))
            }
            it("should be first dictionary if second dictionary is empty") {
                let dictA = ["a":"b"]
                let dictB: [String:String] = [:]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 1
                expect(dictC).to(equal(dictA))
            }
            it("should be second dictionary if first dictionary is empty") {
                let dictA: [String:String] = [:]
                let dictB = ["c":"d"]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 1
                expect(dictC).to(equal(dictB))
            }
            it("should work with strings and numbers as values") {
                let dictA:[AnyHashable:Any] = ["a":"b"]
                let dictB:[AnyHashable:Any] = ["c":3]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 2
                expect(dictC["c"] as? Int).to(equal(3))
            }
            it("should work with strings and numbers as keys") {
                let dictA:[AnyHashable:Any] = ["a":"b"]
                let dictB:[AnyHashable:Any] = [3:"c"]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 2
                expect(dictC[3] as? String).to(equal("c"))
            }
            it("should work with different types for keys ans values") {
                let dictA:[AnyHashable:Any] = ["a":"b", 2: [1, 2], 3:true]
                let dictB:[AnyHashable:Any] = [3:"c", "a":42.1, "key":["dict":"value"]]
                let dictC = dictA.merged(dictB)
                expect(dictC.count) == 4
                expect(dictC[3] as? String).to(equal("c"))
                expect(dictC["a"] as? Double).to(equal(42.1))
            }
        }

    }
}

