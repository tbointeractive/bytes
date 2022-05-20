//
//  DiscardTouchViewSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble

class DiscardTouchViewSpec: QuickSpec {
    override func spec() {
        describe("discardTouches") {
            it("should be true per default") {
                let discardTouchView = DiscardTouchView()
                expect(discardTouchView.discardsTouches) == true
            }
        }
        describe("hitTest") {
            context("with no subviews and discardTouches to true") {
                let discardTouchView = DiscardTouchView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                it("should always return nil") {
                    expect(discardTouchView.hitTest(CGPoint(x: 0, y: 0), with: nil)).to(beNil())
                }
            }
            context("with no subviews and discardTouches to false") {
                let discardTouchView = DiscardTouchView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                discardTouchView.discardsTouches = false
                it("should always return itself") {
                    expect(discardTouchView.hitTest(CGPoint(x: 0, y: 0), with: nil)) == discardTouchView
                }
            }
            context("with a subview and discardTouches to true") {
                let discardTouchView = DiscardTouchView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                discardTouchView.addSubview(UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5)))
                it("should always return nil if the hit test doesn't hit the subview") {
                    expect(discardTouchView.hitTest(CGPoint(x: 1, y: 6), with: nil)).to(beNil())
                }
                it("should return the subview that has been hit") {
                    expect(discardTouchView.hitTest(CGPoint(x: 1, y: 1), with: nil)) == discardTouchView.subviews.first
                }
            }
            context("with a subview and discardTouches to false") {
                let discardTouchView = DiscardTouchView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
                discardTouchView.addSubview(UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 5)))
                discardTouchView.discardsTouches = false
                it("should always return itself if the hit test doesn't hit the subview") {
                    expect(discardTouchView.hitTest(CGPoint(x: 1, y: 6), with: nil)) == discardTouchView
                }
                it("should return the subview that has been hit") {
                    expect(discardTouchView.hitTest(CGPoint(x: 1, y: 1), with: nil)) == discardTouchView.subviews.first
                }
            }
        }
    }
}
