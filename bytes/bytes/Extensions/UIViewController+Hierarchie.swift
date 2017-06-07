//
//  UIViewController+Hierarchie.swift
//  bytes
//
//  Created by Cornelius Horstmann on 03.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Adds a child ViewController and its view.
    ///
    /// - Parameters:
    ///   - viewController: The ViewController to add as a childViewController.
    ///   - constrainView: If set, the added ViewControllers view will be constrained to the edges of the constrainView.
    public func addChildViewController(_ viewController: UIViewController, constrainEdgesTo constrainView: UIView?) {
        addChildViewController(viewController)
        view.addSubview(viewController.view)
        viewController.didMove(toParentViewController: self)
        if let constrainView = constrainView {
            viewController.view.constrainEdges(to: constrainView)
        }
    }
}
