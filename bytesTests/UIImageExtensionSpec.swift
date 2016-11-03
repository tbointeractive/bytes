//
//  UIImageExtensionSpec.swift
//  bytes
//
//  Created by Bernhard Eiling on 28.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

// replace "haveValidSnapshot()" with "recordSnapshot()" to record a new reference image

class UIImageExtensionSpec: QuickSpec {
    
    override func spec() {
        describe("flippedVertically") {
            context("with a CIImage") {
                it ("should return a flipped image") {
                    let imageFromBundle = UIImage(named: "original", in: Bundle(identifier: "com.tbointeractive.bytesTests"), compatibleWith: nil)!
                    let ciimage = CIImage(cgImage: imageFromBundle.cgImage!)
                    let originalImage = UIImage(ciImage: ciimage, scale: 2, orientation: .up)
                    let mutatedImage = originalImage.flippedVertically()
                    expect(UIImageView(image: mutatedImage)).to(haveValidSnapshot())
                }
            }
            it ("should return a flipped image") {
                let originalImage = UIImage(named: "original", in: Bundle(identifier: "com.tbointeractive.bytesTests"), compatibleWith: nil)
                let mutatedImage = originalImage?.flippedVertically()
                expect(UIImageView(image: mutatedImage)).to(haveValidSnapshot())
            }
        }
        describe("flippedHorizontally") {
            it ("should return a flipped image") {
                let originalImage = UIImage(named: "original", in: Bundle(identifier: "com.tbointeractive.bytesTests"), compatibleWith: nil)
                let mutatedImage = originalImage?.flippedHorizontally()
                expect(UIImageView(image: mutatedImage)).to(haveValidSnapshot())
            }
        }
        
        describe("rotatedLeft") {
            it ("should return a rotated image") {
                let originalImage = UIImage(named: "original", in: Bundle(identifier: "com.tbointeractive.bytesTests"), compatibleWith: nil)
                let mutatedImage = originalImage?.rotatedLeft()
                expect(UIImageView(image: mutatedImage)).to(haveValidSnapshot())
            }
        }
        describe("rotatedRight") {
            it ("should return a rotated image") {
                let originalImage = UIImage(named: "original", in: Bundle(identifier: "com.tbointeractive.bytesTests"), compatibleWith: nil)
                let mutatedImage = originalImage?.rotatedRight()
                expect(UIImageView(image: mutatedImage)).to(haveValidSnapshot())
            }
        }
    }

}
