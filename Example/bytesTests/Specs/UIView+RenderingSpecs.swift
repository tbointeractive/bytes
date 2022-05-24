//
//  UIView+RenderingSpecs.swift
//  bytes
//
//  Created by Thorsten Stark on 20.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import bytes

import Quick
import Nimble
import Nimble_Snapshots
import CoreGraphics

// replace "haveValidSnapshot()" with "recordSnapshot()" to record a new reference image

class UIViewRenderingSpecs: QuickSpec {
    override func spec() {
        describe("asImage") {
            it("should have the correct size") {
                let view = Fixture.View.orange()
                let renderedImage = view.asImage()
                expect(renderedImage.size) == view.bounds.size
            }
            it("should have the correct scale") {
                let view = Fixture.View.orange()
                let renderedImage = view.asImage()
                expect(renderedImage.scale) == UIScreen.main.scale
            }
            it("should render an opaque view as an image without an alpha channel") {
                let view = Fixture.View.orangeTransparent()
                view.isOpaque = true
                let renderedImage = view.asImage()
                expect([CGImageAlphaInfo.none, CGImageAlphaInfo.noneSkipLast, CGImageAlphaInfo.noneSkipFirst].contains(renderedImage.cgImage!.alphaInfo)) == true
            }
            it("should render an opaque non-transparent view correctly") {
                let view = Fixture.View.orange()
                view.isOpaque = true
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render an opaque non-transparent view as an image without transparency") {
                let view = Fixture.View.orange()
                view.isOpaque = true
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render a non-opaque view with transparency correctly") {
                let view = Fixture.View.orangeTransparent()
                view.isOpaque = false
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render correct with non-transparant subview") {
                let view = Fixture.View.withSubview()
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render with an opaque and partially transparent subview correctly") {
                let view = Fixture.View.withTransparentSubview()
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render with non-opaque and partially transparent subview correctly") {
                let view = Fixture.View.withTransparentSubview()
                view.subviews.forEach({ $0.isOpaque = false })
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
            it("should render with sublayer") {
                let view = Fixture.View.withSublayer()
                let renderedImage = view.asImage()
                expect(UIImageView(image: renderedImage)).to(haveValidSnapshot())
            }
        }
    }
}
