//
//  Int+RandomSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 23.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class IntRandomSpec: QuickSpec {
    override func spec() {
        describe("randomInRange") {
            it ("should return an integer value inside the given range") {
                let range:Range = 5 ..< 10
                let randomInt = Int.random(in: range)
                expect(range.contains(randomInt)).to(beTrue())
            }
            it ("should return allwas the same value when range has length of one") {
                let range:Range = 2 ..< 3
                for _ in 1 ..< 100 {
                    let randomInt = Int.random(in: range)
                    expect(randomInt) == 2
                }
            }
            it ("should return 0 if the range is empty") {
                let range:Range = 1..<1
                let randomInt = Int.random(in: range)
                expect(range.isEmpty).to(beTrue())
                expect(randomInt) == 0
            }
        }
    }
}
