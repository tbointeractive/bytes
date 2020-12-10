//
//  UIViewExtensions.swift
//  bytes
//
//  Created by Thorsten Stark on 25.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

public extension UIView {
    /// Add an equal constraint from this view to another view
    ///
    /// - parameter attribute: The layout attribute to be used
    /// - parameter to: Target object
    /// - parameter multiplier: The multiplier (default = 1)
    /// - parameter constant: The constant value (default = 0)
    /// - parameter priority: The UILayoutPriority value (default = .required)
    /// - Returns: The constraint that has been set
    @objc @discardableResult func constrainEqual(attribute: NSLayoutConstraint.Attribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return constrain(attribute, to: to, attribute: attribute, relation: .equal, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Add an equal constraint from this view to a constant
    ///
    /// - Parameters:
    /// - parameter attribute: The layout attribute to be used
    /// - parameter to: CGFloat constant to constrain this attribute to
    /// - parameter priority: The UILayoutPriority value (default = .required)
    /// - Returns: The constraint that has been set
    @objc @discardableResult func constrainEqual(attribute: NSLayoutConstraint.Attribute, to constant: CGFloat, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return constrain(attribute, to: nil, attribute: .notAnAttribute, relation: .equal, multiplier: 1, constant: constant, priority: priority)
    }
    
    /// A a constraint with lessThanOrEqual relation
    ///
    /// - parameter attribute: The layout attribute to be used
    /// - parameter to: Target object
    /// - parameter multiplier: The multiplier (default = 1)
    /// - parameter constant: The constant value (default = 0)
    /// - parameter priority: The UILayoutPriority value (default = .required)
    /// - Returns: The constraint that has been set
    @objc @discardableResult func constrainLessThanOrEqual(attribute: NSLayoutConstraint.Attribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return constrain(attribute, to: to, attribute: attribute, relation: .lessThanOrEqual, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Add a greaterThanOrEqual constraint from this view to another view
    ///
    /// - parameter attribute: The layout attribute to be used
    /// - parameter to: Target object
    /// - parameter multiplier: The multiplier (default = 1)
    /// - parameter constant: The constant value (default = 0)
    /// - parameter priority: The UILayoutPriority value (default = .required)
    /// - Returns: The constraint that has been set
    @objc @discardableResult func constrainGreaterThanOrEqual(attribute: NSLayoutConstraint.Attribute, to: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        return constrain(attribute, to: to, attribute: attribute, relation: .greaterThanOrEqual, multiplier: multiplier, constant: constant, priority: priority)
    }
    
    /// Add a constraint from this view to another view
    ///
    /// - parameter attribute: A NSLayoutAttribute layout attribute for this view
    /// - parameter to: optional Target object
    /// - parameter toAttribute: A NSLayoutAttribute for the target object
    /// - parameter relation: A NSLayoutRelation (default = .equal)
    /// - parameter multiplier: The multiplier (default = 1)
    /// - parameter constant: The constant value (default = 0)
    /// - parameter priority: The UILayoutPriority value (default = .required)
    /// - Returns: The constraint that has been set
    @objc @discardableResult func constrain(_ attribute: NSLayoutConstraint.Attribute, to: UIView?, attribute toAttribute: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: relation, toItem: to, attribute: toAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    /// Fits this view to the edges of another view
    ///
    /// - Parameter view: The UIView to which edges this view should be contrainted
    /// - Returns: The constraints that have been set
    @objc @discardableResult func constrainEdges(to view: UIView) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(constrainEqual(attribute: .top, to: view))
        constraints.append(constrainEqual(attribute: .leading, to: view))
        constraints.append(constrainEqual(attribute: .trailing, to: view))
        constraints.append(constrainEqual(attribute: .bottom, to: view))
        return constraints
    }
    
    /// Fits this view to the margins of another view
    ///
    /// - Parameter view: The UIView to which margings this view should be contrainted
    /// - Returns: The constraints that have been set
    @objc @discardableResult func constrainEdges(toMarginOf view: UIView) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(constrain(.top, to: view, attribute: .topMargin, relation: .equal))
        constraints.append(constrain(.leading, to: view, attribute: .leadingMargin, relation: .equal))
        constraints.append(constrain(.trailing, to: view, attribute: .trailingMargin, relation: .equal))
        constraints.append(constrain(.bottom, to: view, attribute: .bottomMargin, relation: .equal))
        return constraints
    }
}
