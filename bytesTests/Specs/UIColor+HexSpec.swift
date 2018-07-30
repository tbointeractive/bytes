//
//  UIColorHexStringExtensionSpec.swift
//  bytes
//
//  Created by Bernhard Eiling on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class UIColorHexStringExtensionSpec: QuickSpec {
    override func spec() {
        describe("init(hexString:)") {
            it ("with #0099ff should return the correct color") {
                let uiColor = UIColor(hexString: "#0099ff")!
                let referenceColor = UIColor(red: 0, green: 153/255, blue: 1, alpha: 1)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with #0099ff99 should return the correct color") {
                let uiColor = UIColor(hexString: "#0099ff99")
                let referenceColor = UIColor(red: 0, green: 153/255, blue: 1, alpha: 153/255)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with0099ff99 should return the correct color") {
                let uiColor = UIColor(hexString: "0099ff99")
                let referenceColor = UIColor(red: 0, green: 153/255, blue: 1, alpha: 153/255)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with #AB5 should return the correct color") {
                let uiColor = UIColor(hexString: "#AB5")
                let referenceColor = UIColor(red: 10/15, green: 11/15, blue: 5/15, alpha: 1)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with #AB5B should return the correct color") {
                let uiColor = UIColor(hexString: "#AB5A")
                let referenceColor = UIColor(red: 10/15, green: 11/15, blue: 5/15, alpha: 10/15)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with AB5 should return the correct color") {
                let uiColor = UIColor(hexString: "AB5")
                let referenceColor = UIColor(red: 10/15, green: 11/15, blue: 5/15, alpha: 1)
                expect(uiColor).to(equal(referenceColor))
            }
            it ("with 0B5A should return the correct color") {
                let uiColor = UIColor(hexString: "0B5A")
                let referenceColor = UIColor(red: 0, green: 11/15, blue: 5/15, alpha: 10/15)
                expect(uiColor).to(equal(referenceColor))
            }
            
            it ("with XXX should return nil") {
                let uiColor = UIColor(hexString: "XXX")
                expect(uiColor).to(beNil())
            }
            it ("with empty string should return nil") {
                let uiColor = UIColor(hexString: "")
                expect(uiColor).to(beNil())
            }
            it ("with a wrong character should return nil") {
                let uiColor = UIColor(hexString: "#ab3x22")
                expect(uiColor).to(beNil())
            }
            it ("with a wrong amount of characters should return nil") {
                let uiColor = UIColor(hexString: "#aaccf")
                expect(uiColor).to(beNil())
            }
            
        }
    }
}

