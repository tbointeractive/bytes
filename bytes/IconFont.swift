//
//  IconFont.swift
//  bytes
//
//  Created by Cornelius Horstmann on 02.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

/// An IconFont is a class that helps handling icon fonts. 
/// You can generate your own icon font on different sites, such as: http://fontello.com
///
/// We recommend to subclass IconFont and have a `static let defaultFont = IconFont(font: UIFont(name: "your-font-name", size: 1.0))`.
/// Also consider to add a custom enum to map all your icon identifiers.
class IconFont: NSObject {
    
    /// The font that is used to generate images and strings
    public private(set) var font: UIFont
    
    /// Creates a new IconFont using a font
    ///
    /// - Parameter font: The font that should be used to generate images and strings.
    init(font: UIFont) {
        self.font = font
    }
    
    /// Creates a NSAttributedString for the icon with the identifier and a certain height
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the icon. For example `"\u{E800}"`.
    ///   - size: The font size.
    /// - Returns: The string with the icon.
    func iconString(identifier: String, size: CGFloat) -> NSAttributedString? {
        let sizedFont = font.withSize(size)
        return NSAttributedString(string: identifier, attributes: [NSFontAttributeName:sizedFont, NSForegroundColorAttributeName: UIColor.black])
    }
    
    /// Creates a UIImage with rendering mode `.alwaysTemplate` of the icon in a certain size
    ///
    /// - Parameters:
    ///   - identifier: The identifier of the icon. For example `"\u{E800}"`
    ///   - size: The size of the image. The height of this size is used as the height of the icon. Please calculate the width so that the icon fits.
    /// - Returns: The template image of that icon.
    func iconImage(identifier: String, size: CGSize) -> UIImage? {
        guard let attributedString = iconString(identifier: identifier, size: size.height) else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = NSStringDrawingContext()
        let boundingRect = attributedString.boundingRect(with: size, options: [], context: context)
        let drawRect = CGRect(x: size.width / 2.0 - boundingRect.size.width / 2.0, y: size.height / 2.0 - boundingRect.size.height / 2.0, width: size.width, height: size.height)
        attributedString.draw(in: drawRect)
        let icon = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return icon?.withRenderingMode(.alwaysTemplate)
    }
    
}
