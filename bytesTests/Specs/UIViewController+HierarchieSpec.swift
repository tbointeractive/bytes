//
//  UIViewControllerHierarchieSpecs.swift
//  bytes
//
//  Created by Cornelius Horstmann on 03.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class UIViewControllerHierarchieSpec: QuickSpec {
    override func spec() {
        describe("addChildViewController:constrainEdgesTo") {
            it("should add a childViewController") {
                let parentViewController = UIViewController()
                let childViewController = UIViewController()
                parentViewController.addChildViewController(childViewController, constrainEdgesTo: parentViewController.view)
                expect(childViewController.parent).to(equal(parentViewController))
            }
            it("should add constraints to the added view if the constrainEdgesTo parameter is set") {
                let parentViewController = UIViewController()
                let childViewController = UIViewController()
                parentViewController.addChildViewController(childViewController, constrainEdgesTo: parentViewController.view)
                expect(parentViewController.view.constraints.count).to(equal(4))
            }
            it("should not add constraints to the added view if the constrainEdgesTo parameter is nil") {
                let parentViewController = UIViewController()
                let childViewController = UIViewController()
                parentViewController.addChildViewController(childViewController, constrainEdgesTo: nil)
                expect(parentViewController.view.constraints.count).to(equal(0))
            }
        }
    }
}
