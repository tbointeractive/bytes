//
//  IconFontSpecs.swift
//  bytes
//
//  Created by Cornelius Horstmann on 02.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble
import Nimble_Snapshots

class IconFontSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should initialize the object and store the font") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                expect(iconFont).toNot(beNil())
                expect(iconFont.font).to(equal(font))
            }
        }
        describe("iconString") {
            it("should return a string when used with a valid identifier") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                let string = iconFont.iconString(identifier: "\u{Eabe}", size: 20.0)
                expect(string).toNot(beNil())
            }
            it("should return a string whith the correct size") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                let string = iconFont.iconString(identifier: "\u{Eabe}", size: 20.0)
                let usedFont = string?.attributes(at: 0, effectiveRange: nil)[NSAttributedStringKey.font] as! UIFont
                expect(usedFont.pointSize) == 20.0
            }
        }
        describe("iconImage") {
            it("should return the correct image") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                let image = iconFont.iconImage(identifier: "\u{Eabe}", size: CGSize(width: 20.0, height: 20.0))
                expect(image).toNot(beNil())
                let imageView = UIImageView(image: image)
                imageView.tintColor = UIColor.black
                expect(imageView).to(haveValidSnapshot())
            }
            it("should use the height as the fontSize") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                let image = iconFont.iconImage(identifier: "\u{Eabe}", size: CGSize(width: 50.0, height: 20.0))
                let imageView = UIImageView(image: image)
                imageView.tintColor = UIColor.black
                expect(image).toNot(beNil())
                expect(imageView).to(haveValidSnapshot())
            }
            it("should return a template image") {
                let font = UIFont(name: "iconfont", size: 1.0)!
                let iconFont = IconFont(font: font)
                let image = iconFont.iconImage(identifier: "\u{Eabe}", size: CGSize(width: 20.0, height: 20.0))
                let imageView = UIImageView(image: image)
                imageView.tintColor = UIColor.blue
                expect(image).toNot(beNil())
                expect(imageView).to(haveValidSnapshot())
            }
        }
    }
}
