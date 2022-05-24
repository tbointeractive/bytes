//
//  Fixture.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

struct Fixture {
    struct View {
        static func orange() -> UIView {
            return view()
        }
        
        static func orangeTransparent() -> UIView {
            return view(color: UIColor.orange.withAlphaComponent(0.5))
        }
        
        static func withSubview() -> UIView {
            let outerView = orange()
            let innerView = view(origin: CGPoint(x: 5, y: 5), size: CGSize(width:20, height: 20), color: UIColor.purple)
            outerView.addSubview(innerView)
            return outerView
        }
        
        static func withTransparentSubview() -> UIView {
            let outerView = orange()
            let innerView = view(origin: CGPoint(x: 5, y: 5), size: CGSize(width:20, height: 20), color: UIColor.purple.withAlphaComponent(0.5))
            outerView.addSubview(innerView)
            return outerView
        }
        
        static func withSublayer() -> UIView {
            let outerView = orange()
            let layer = CALayer()
            layer.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
            layer.backgroundColor = UIColor.yellow.cgColor
            outerView.layer.addSublayer(layer)
            return outerView
        }
        
        private static func view(origin: CGPoint = CGPoint(), size: CGSize = CGSize(width: 40, height: 40), color: UIColor = UIColor.orange) -> UIView {
            let view = UIView(frame: CGRect(origin: origin, size: size))
            view.backgroundColor = color;
            return view
        }
    }
}

