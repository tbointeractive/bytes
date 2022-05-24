//
//  UIImage+ColorSpec.swift
//  bytesTests
//
//  Created by Cornelius Horstmann on 06.06.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble
import Nimble_Snapshots

// replace "haveValidSnapshot()" with "recordSnapshot()" to record a new reference image

class UIImageColorSpec: QuickSpec {
    override func spec() {
        describe("uiimagefromcolorcache") {
            it("should be not nil per default") {
                expect(UIImage.imageFromColorCache).toNot(beNil())
            }
            it("should have a countLimit of 10 per default") {
                expect(UIImage.imageFromColorCache?.countLimit) == 10
            }
            it("should be settable and keep its settings") {
                let oldCache = UIImage.imageFromColorCache
                UIImage.imageFromColorCache = NSCache<UIColor, UIImage>()
                expect(UIImage.imageFromColorCache?.countLimit) == 0
                UIImage.imageFromColorCache = oldCache
            }
            it("should be settable to nil") {
                let oldCache = UIImage.imageFromColorCache
                UIImage.imageFromColorCache = nil
                expect(UIImage.imageFromColorCache).to(beNil())
                UIImage.imageFromColorCache = oldCache
            }
        }
        describe("fromColor") {
            it("should return an image") {
                let image = UIImage.from(.green)
                expect(image).toNot(beNil())
            }
            it("should return an image with the size of 1x1") {
                let image = UIImage.from(.green)
                expect(image.size) == CGSize(width: 1, height: 1)
            }
            it("should return the exact same image from the cache if requesting one with the same color") {
                let imageOne = UIImage.from(.green)
                let imageTwo = UIImage.from(.green)
                expect(imageOne == imageTwo) == true
            }
            it("should return an image with the correct color") {
                let image = UIImage.from(.green)
                expect(UIImageView(image: image)).to(haveValidSnapshot())
            }
            it("should return an image with the correct color, if the color has an alpha value") {
                let color = UIColor.green.setting(alpha: 0.5)
                let image = UIImage.from(color)
                expect(UIImageView(image: image)).to(haveValidSnapshot())
            }
        }
    }
}
