//
//  UIColorSettingValuesExtensionSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

extension UIColor {
    func red() -> CGFloat {
        var value: CGFloat = 0.0
        getRed(&value, green: nil, blue: nil, alpha: nil)
        return value
    }
    func green() -> CGFloat {
        var value: CGFloat = 0.0
        getRed(nil, green: &value, blue: nil, alpha: nil)
        return value
    }
    func blue() -> CGFloat {
        var value: CGFloat = 0.0
        getRed(nil, green: nil, blue: &value, alpha: nil)
        return value
    }
    func alpha() -> CGFloat {
        var value: CGFloat = 0.0
        getRed(nil, green: nil, blue: nil, alpha: &value)
        return value
    }
}

class UIColorSettingValueExtensionSpec: QuickSpec {
    override func spec() {
        describe("setting") {
            it("should set the red value") {
                let black = UIColor.black
                let red = black.setting(red: 1.0)
                expect(red) == UIColor.red
            }
            it("should set the green value") {
                let black = UIColor.black
                let green = black.setting(green: 1.0)
                expect(green) == UIColor.green
            }
            it("should set the blue value") {
                let black = UIColor.black
                let blue = black.setting(blue: 1.0)
                expect(blue) == UIColor.blue
            }
            it("should set the alpha value") {
                let white = UIColor.white
                let alpha = white.setting(alpha: 0.0)
                expect(alpha.red()) == 1.0
                expect(alpha.green()) == 1.0
                expect(alpha.blue()) == 1.0
                expect(alpha.alpha()) == 0.0
            }
        }
    }
}
