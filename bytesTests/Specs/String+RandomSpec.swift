//
//  String+RandomSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 23.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//


import bytes

import Quick
import Nimble

class StringRandomSpec: QuickSpec {
    override func spec() {
        describe("randomWith") {
            let chars:[Character] = ["a", "b", "c", "x", "y", "z"]
            it ("should return a string with the given number of characters") {
                let randomString = String.random(with: chars, length: 3)
                expect(randomString.count) == 3
            }
            it ("should return a string which contains only characters within the given array") {
                let randomString = String.random(with: chars, length: 20)
                for char in randomString {
                    expect(chars.contains(char)).to(beTrue())
                }
            }
        }
    }
}
