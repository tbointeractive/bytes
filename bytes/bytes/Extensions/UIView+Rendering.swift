//
//  UIView+Rendering.swift
//  bytes
//
//  Created by Thorsten Stark on 20.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Returns a rendered UIImage of the UIView
    /// - discussion: You might consider executing this method in a background thread, 
    ///   because the rendering of a complete view may take some time.
    ///
    /// - Returns: UIImage of the view
    public func asImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(frame.size, isOpaque, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
