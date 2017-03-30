//
//  UIColor+Components.swift
//  bytes
//
//  Created by Cornelius Horstmann on 05.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIColor {
    /// Allows setting some or all of the red, green, blue and alpha values of a color.
    /// You can omit any of the values or set it to nil, to keep the value of the color.
    ///
    /// - Parameters:
    ///   - red: the new value for the red portion
    ///   - green: the new value for the green portion
    ///   - blue: the new value for the blue portion
    ///   - alpha: the new value for the alpha portion
    /// - Returns: a new color with all of the new values set
    public func setting(red: CGFloat? = nil, green: CGFloat? = nil, blue: CGFloat? = nil, alpha: CGFloat? = nil) -> UIColor {
        var oldRed: CGFloat = 0.0
        var oldGreen: CGFloat = 0.0
        var oldBlue: CGFloat = 0.0
        var oldAlpha: CGFloat = 0.0
        
        getRed(&oldRed, green: &oldGreen, blue: &oldBlue, alpha: &oldAlpha)
        let resolvedRed = red ?? oldRed
        let resolvedGreen = green ?? oldGreen
        let resolvedBlue = blue ?? oldBlue
        let resolvedAlpha = alpha ?? oldAlpha
        
        return UIColor(red: resolvedRed, green: resolvedGreen, blue: resolvedBlue, alpha: resolvedAlpha)
    }
}
