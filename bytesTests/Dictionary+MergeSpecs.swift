//
//  Dictionary+MergeSpecs.swift
//  bytes
//
//  Created by Thorsten Stark on 20.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class DictionaryMergeSpecs: QuickSpec {
    override func spec() {
        describe("merge") {
            it("should add second dictionary when no keys overlap") {
                var dictA = ["a":"b"]
                let dictB = ["c":"d"]
                dictA.merge(dictB)
                expect(dictA.count) == 2
                expect(dictA["a"]).to(equal("b"))
                expect(dictA["c"]).to(equal("d"))
            }
            it("should override keys when already exited") {
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
                let value = dictA["c"] as! Int
                expect(value).to(equal(3))
            }
            it("should work with strings and numbers as keys") {
                var dictA:[AnyHashable:Any] = ["a":"b"]
                let dictB:[AnyHashable:Any] = [3:"c"]
                dictA.merge(dictB)
                expect(dictA.count) == 2
                let value = dictA[3] as! String
                expect(value).to(equal("c"))
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
        
    }
}

