//
//  UIImageExtension.swift
//  bytes
//
//  Created by Bernhard Eiling on 28.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIImage {

    /// Returns a UIImage that is horizontally flipped.
    ///
    /// - returns: a new UIImage
    public func flippedHorizontally() -> UIImage {
        return image(with: .upMirrored)
    }
    
    /// Returns a UIImage that is vertically flipped.
    ///
    /// - returns: a new UIImage
    public func flippedVertically() -> UIImage {
        return image(with: .downMirrored)
    }
    
    /// Returns a UIImage that is rotated to the left by 90 degrees.
    ///
    /// - returns: a new UIImage
    public func rotatedLeft() -> UIImage {
        return image(with: .left)
    }
    
    /// Returns a UIImage that is rotated to the right by 90 degrees.
    ///
    /// - returns: a new UIImage
    public func rotatedRight() -> UIImage {
        return image(with: .right)
    }

    private func image(with orientation: UIImageOrientation) -> UIImage {
        if let cgImage = cgImage {
            return UIImage(cgImage: cgImage, scale: scale, orientation: orientation)
        }
        if let ciImage = ciImage {
            return UIImage(ciImage: ciImage, scale: scale, orientation: orientation)
        }
        fatalError("no image data given")
    }

}
