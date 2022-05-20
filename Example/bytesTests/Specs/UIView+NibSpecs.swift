//
//  UIView+NibSpecs.swift
//  bytesTests
//
//  Created by Cornelius Horstmann on 29.10.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class UIViewNibSpecs: QuickSpec {
    override func spec() {
        describe("fromNib") {
            it("returns nil if no nib is found") {
                let view = UIView.fromNib(type: UIView.self)
                expect(view).to(beNil())
            }
            it("returns nil if the nib is empty") {
                let view = UIView.fromNib("Empty", bundle: Bundle(for: UIViewNibSpecs.self), type: UIView.self)
                expect(view).to(beNil())
            }
            it("returns a view if such a nib exists") {
                let view = UIView.fromNib("SingleView", bundle: Bundle(for: UIViewNibSpecs.self), type: UIView.self)
                expect(view).toNot(beNil())
            }
            it("returns nil if the wrong bundle was uses") {
                let view = UIView.fromNib("SingleView", type: UIView.self)
                expect(view).to(beNil())
            }
            it("returns the first view if a xib contains multiple views") {
                let view = UIView.fromNib("MultipleViews", bundle: Bundle(for: UIViewNibSpecs.self), type: SingleView.self)
                expect(view).toNot(beNil())
            }
            it("uses the classname as nib name per default") {
                let view = SingleView.fromNib()
                expect(view).toNot(beNil())
            }
        }
    }
}
