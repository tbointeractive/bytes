//
//  UIViewExtensions.swift
//  bytes
//
//  Created by Thorsten Stark on 25.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Add an equal constraint from this view to another view
    ///
    /// - Parameters:
    ///   - attribute: The layout attribute to be used
    ///   - to: Target object
    ///   - multiplier: The multiplier (default = 1)
    ///   - constant: The constant value (default = 0)
    public func constrainEqual(attribute: NSLayoutAttribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrain(attribute, to: to, attribute: attribute, relation: .equal, multiplier: multiplier, constant: constant)
    }
    
    /// A a constraint with lessThanOrEqual relation
    ///
    /// - Parameters:
    ///   - attribute: The layout attribute to be used
    ///   - to: Target object
    ///   - multiplier: The multiplier (default = 1)
    ///   - constant: The constant value (default = 0)
    public func constrainLessThanOrEqual(attribute: NSLayoutAttribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrain(attribute, to: to, attribute: attribute, relation: .lessThanOrEqual, multiplier: multiplier, constant: constant)
    }
    
    /// Add a greaterThanOrEqual constraint from this view to another view
    ///
    /// - Parameters:
    ///   - attribute: The layout attribute to be used
    ///   - to: Target object
    ///   - multiplier: The multiplier (default = 1)
    ///   - constant: The constant value (default = 0)
    public func constrainGreaterThanOrEqual(attribute: NSLayoutAttribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrain(attribute, to: to, attribute: attribute, relation: .greaterThanOrEqual, multiplier: multiplier, constant: constant)
    }
    
    /// Add a constraint from this view to another view
    ///
    /// - Parameters:
    ///   - attribute: A NSLayoutAttribute layout attribute for this view
    ///   - to: Target object
    ///   - toAttribute: A NSLayoutAttribute for the target object
    ///   - relation: A NSLayoutRelation (default = .equal)
    ///   - multiplier: The multiplier (default = 1)
    ///   - constant: The constant value (default = 0)
    public func constrain(_ attribute: NSLayoutAttribute, to: UIView, attribute toAttribute: NSLayoutAttribute, relation: NSLayoutRelation, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: to, attribute: toAttribute, multiplier: multiplier, constant: constant)
            ]
        )
    }
    
    /// Fits this view to the edges of another view
    ///
    /// - Parameter view: The UIView to which edges this view should be contrainted
    public func constrainEdges(to view: UIView) {
        constrainEqual(attribute: .top, to: view)
        constrainEqual(attribute: .leading, to: view)
        constrainEqual(attribute: .trailing, to: view)
        constrainEqual(attribute: .bottom, to: view)
    }
    
    /// Fits this view to the margins of another view
    ///
    /// - Parameter view: The UIView to which margings this view should be contrainted 
    public func constrainEdges(toMarginOf view: UIView) {
        constrain(.top, to: view, attribute: .topMargin, relation: .equal)
        constrain(.leading, to: view, attribute: .leadingMargin, relation: .equal)
        constrain(.trailing, to: view, attribute: .trailingMargin, relation: .equal)
        constrain(.bottom, to: view, attribute: .bottomMargin, relation: .equal)
    }
}
