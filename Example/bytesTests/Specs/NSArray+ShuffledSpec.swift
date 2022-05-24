//
//  NSArray+ShuffleSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 13.05.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class NSArrayShuffledSpec: QuickSpec {
    override func spec() {
        describe("shuffled") {
            it("should return the same amount of items") {
                let array = [0,1,2,3,4,5,6,7,8,9]
                let shuffled = array.shuffled()
                expect(shuffled.count) == array.count
            }
            it("should not change the original items") {
                let array = [0,1,2,3,4,5,6,7,8,9]
                let _ = array.shuffled()
                expect(array) == [0,1,2,3,4,5,6,7,8,9]
            }
            it("should work with NSArrays") {
                let array = [0,1,2,3,4,5,6,7,8,9]
                let nsarray = array as NSArray
                let shuffled = nsarray.shuffled()
                expect(shuffled.count) == nsarray.count
            }
        }
        describe("random") {
            it("should return an element of the original collection") {
                let array = [0,1,2,3,4,5,6,7,8,9]
                let element = array.random
                expect(array.contains(element!)) == true
            }
            it("should return nil for an empty array") {
                let array: [Int] = []
                expect(array.random).to(beNil())
            }
        }
    }
}
