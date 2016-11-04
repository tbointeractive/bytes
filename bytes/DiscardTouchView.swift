//
//  DiscardTouchView.swift
//  bytes
//
//  Created by Cornelius Horstmann on 01.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit


/// A DiscardTouchView is a view that can be configured to discard all
/// touches that hit the view itself but don't hit any subviews
class DiscardTouchView: UIView {
    
    /// configures whether the view should discard all touches sent to it
    /// or to absorb them
    ///
    /// default = true
    var discardsTouches: Bool = true
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView == self && discardsTouches {
            return nil
        }
        return hitView
    }
}
