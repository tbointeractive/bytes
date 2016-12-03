//
//  UIViewExtensionsSpec.swift
//  bytes
//
//  Created by Thorsten Stark on 27.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class UIViewExtensionsSpec: QuickSpec {
    override func spec() {
        describe("constrain") {
            it("should add one default constraint to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrain(.top, to: secondView, attribute: .top, relation: .equal)
                expect(firstView.constraints.count).to(equal(1))
                let constraint = firstView.constraints.first as NSLayoutConstraint?
                expect(constraint?.constant).to(equal(0.0))
                expect(constraint?.relation.rawValue).to(equal(0))
            }
            it("should add one constraint with constant 3.0 and bottom attribute") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrain(.bottom, to: secondView, attribute: .bottom, relation: .equal, constant: 3.0)
                let constraint = firstView.constraints.first as NSLayoutConstraint?
                expect(constraint?.constant).to(equal(3.0))
                expect(constraint?.firstAttribute.rawValue).to(equal(4))
            }
        }
        describe("constrainEqual") {
            it("should add a Equal constraint to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrainEqual(attribute: .top, to: secondView)
                let constraint = firstView.constraints.first as NSLayoutConstraint?
                expect(constraint?.relation.rawValue).to(equal(0))
            }
        }
        describe("constrainLessThanOrEqual") {
            it("should add a LessThanOrEqual constraint to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrainLessThanOrEqual(attribute: .top, to: secondView)
                let constraint = firstView.constraints.first as NSLayoutConstraint?
                expect(constraint?.relation.rawValue).to(equal(-1))
            }
        }
        describe("constrainGreaterThanOrEqual") {
            it("should add a GreaterThanOrEqual constraint to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrainGreaterThanOrEqual(attribute: .top, to: secondView)
                let constraint = firstView.constraints.first as NSLayoutConstraint?
                expect(constraint?.relation.rawValue).to(equal(1))
            }
        }
        describe("constrainEdgesToMargin") {
            it("should add 4 constraints to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrainEdges(toMarginOf: secondView)
                expect(firstView.constraints.count).to(equal(4))
            }
        }
        describe("constrainEdgesTo") {
            it("should add 4 constraints to first view") {
                let firstView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                let secondView = UIView(frame: CGRect(x:0, y:0, width: 10, height:10))
                firstView.addSubview(secondView)
                firstView.constrainEdges(to: secondView)
                expect(firstView.constraints.count).to(equal(4))
            }
        }
    }
}

