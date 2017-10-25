//
//  UIColorExtensions.swift
//  bytes
//
//  Created by Cornelius Horstmann on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// Initializes and returns a color object using a hexadecimal String.
    ///
    /// - note: Formats supported: "RRGGBBAA", "RRGGBB" and "RGBA", "RGB" with optional leading hashtag.
    ///
    /// - Parameter hexString: A hexadecimal String repesenting the color value.
    ///
    /// - Returns: An instance of UIColor
    public convenience init?(hexString: String) {
        var hexInt: UInt32 = 0
        let scanner = Scanner(string: hexString)
        var stringLength = hexString.characters.count
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
            stringLength -= 1
        }
        guard [3,4,6,8].contains(stringLength) else { return nil }
        let bitsPerColor: UInt8 = [3,4].contains(stringLength) ? 4 : 8
        let hasAlpha = [4,8].contains(stringLength)
        let colorLevels: UInt32 = UInt32(pow(Double(2),Double(bitsPerColor))) - 1 // so 15 or 255
        
        guard scanner.scanHexInt32(&hexInt) else { return nil }
        guard scanner.scanLocation == hexString.characters.count else { return nil } // can happen for strings such as #00x000 because x is not a hex value
        
        var red: UInt32 = 0
        var green: UInt32 = 0
        var blue: UInt32 = 0
        var alpha: UInt32 = colorLevels
        
        if (hasAlpha) {
            hexInt.shiftRight(bits: bitsPerColor, into: &alpha)
        }
        hexInt.shiftRight(bits: bitsPerColor, into: &blue)
        hexInt.shiftRight(bits: bitsPerColor, into: &green)
        hexInt.shiftRight(bits: bitsPerColor, into: &red)
        
        self.init(red: CGFloat(red) / CGFloat(colorLevels), green: CGFloat(green) / CGFloat(colorLevels), blue: CGFloat(blue) / CGFloat(colorLevels), alpha: CGFloat(alpha) / CGFloat(colorLevels))
    }
}

extension UInt32 {
    internal mutating func shiftRight(bits steps: UInt8, into: UnsafeMutablePointer<UInt32>) {
        let bitmaskString = String(repeating: "F", count: Int(CGFloat(steps) / 4.0))
        let bitmask = UInt32(bitmaskString, radix: 16)!
        into.pointee = self & bitmask
        self = self >> (UInt32(steps))
    }
}
