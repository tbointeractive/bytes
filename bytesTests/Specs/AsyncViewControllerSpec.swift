//
//  AsyncViewControllerSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 04.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class AsyncViewControllerSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should initialize the object with a load closure") {
                let async = AsyncViewController() { _ in }
                expect(async) != nil
            }
            it("should set the state to idle") {
                let async = AsyncViewController() { _ in }
                expect(async.state) == AsyncViewController.State.idle
            }
            it("should have a view") {
                let async = AsyncViewController() { _ in }
                expect(async.view) != nil
            }
            it("should only have a hidden loadingView as a subview") {
                let async = AsyncViewController() { _ in }
                expect(async.view.subviews.count) == 1
                expect(async.view.subviews.first) == async.loadingView
                expect(async.view.subviews.first?.isHidden) == true
            }
            it("should not create a retain cycle") {
                var async: AsyncViewController? = AsyncViewController() { _ in }
                weak var weakAsync = async
                async = nil
                expect(weakAsync).to(beNil())
            }
            it("should not create a retain cycle when the load closure was called") {
                var async: AsyncViewController? = AsyncViewController() { async in
                    let _ = async.state
                }
                weak var weakAsync = async
                async?.start()
                async = nil
                expect(weakAsync).to(beNil())
            }
        }
        describe("viewWillAppear") {
            it("should call the load closure") {
                var calledLoad = false
                let async = AsyncViewController() { _ in
                    calledLoad = true
                }
                expect(calledLoad) == false
                async.viewWillAppear(false)
                expect(calledLoad) == true
            }
        }
        describe("start") {
            it("should call the load closure") {
                var calledLoad = false
                let async = AsyncViewController() { _ in
                    calledLoad = true
                }
                expect(calledLoad) == false
                async.start()
                expect(calledLoad) == true
            }
            it("should set the state to loading") {
                let async = AsyncViewController() { _ in }
                async.start()
                expect(async.state) == AsyncViewController.State.loading
            }
            it("should display a loading view") {
                let async = AsyncViewController() { _ in }
                async.start()
                expect(async.view.subviews).to(contain(async.loadingView))
                expect(async.loadingView.isHidden) == false
            }
            it("should hide an existing errorView") {
                let async = AsyncViewController() { _ in }
                async.start()
                async.fail(nil)
                expect(async.state) == AsyncViewController.State.error
                async.start()
                expect(async.view.subviews.count) == 1
            }
            it("should do nothing if the state is loading") {
                var loadCallCount = 0
                let async = AsyncViewController() { _ in
                    loadCallCount += 1
                }
                async.start()
                async.start()
                expect(loadCallCount) == 1
            }
            it("should do nothing if the state is finished") {
                var loadCallCount = 0
                let async = AsyncViewController() { _ in
                    loadCallCount += 1
                }
                async.start()
                async.finish(content: UIViewController())
                async.start()
                expect(async.state) == AsyncViewController.State.finished
                expect(loadCallCount) == 1
            }
        }
        describe("fail") {
            context("when the state is idle") {
                let async = AsyncViewController() { _ in }
                it("should not change the state") {
                    async.fail(nil)
                    expect(async.state) == AsyncViewController.State.idle
                }
            }
            context("when the state is finished") {
                let async = AsyncViewController() { _ in }
                async.start()
                async.finish(content: UIViewController())
                it("should not change the state") {
                    async.fail(nil)
                    expect(async.state) == AsyncViewController.State.finished
                }
            }
            context("when the state is loading") {
                var async: AsyncViewController!
                beforeEach {
                    async = AsyncViewController() { _ in }
                    async.start()
                }
                it("should set the state to error") {
                    async.fail(nil)
                    expect(async.state) == AsyncViewController.State.error
                }
                it("should hide the loading view") {
                    async.fail(nil)
                    expect(async.loadingView.isHidden) == true
                }
                it("should display the error view") {
                    async.fail(nil)
                    let errorView = async.view.subviews.filter{ $0 != async.loadingView}.first!
                    expect(async.view.subviews.count) == 2
                    expect(errorView.isHidden) == false
                }
            }
        }
        describe("finish") {
            context("when the state is idle") {
                let async = AsyncViewController() { _ in }
                it("should not change the state") {
                    async.finish(content: UIViewController())
                    expect(async.state) == AsyncViewController.State.idle
                }
                it("should not add the viewController and view") {
                    let viewController = UIViewController()
                    async.finish(content: viewController)
                    expect(async.view.subviews).toNot(contain(viewController.view))
                    expect(viewController.parent).to(beNil())
                }
            }
            context("when the state is finished") {
                let async = AsyncViewController() { _ in }
                async.start()
                async.finish(content: UIViewController())
                it("should not change the state") {
                    async.finish(content: UIViewController())
                    expect(async.state) == AsyncViewController.State.finished
                }
                it("should not add the viewController and view") {
                    let viewController = UIViewController()
                    async.finish(content: viewController)
                    expect(async.view.subviews).toNot(contain(viewController.view))
                    expect(viewController.parent).to(beNil())
                }
            }
            context("when the state is loading") {
                var async: AsyncViewController!
                beforeEach {
                    async = AsyncViewController() { _ in }
                    async.start()
                }
                it("should set the state to finished") {
                    async.finish(content: UIViewController())
                    expect(async.state) == AsyncViewController.State.finished
                }
                it("should hide the loading view") {
                    async.finish(content: UIViewController())
                    expect(async.loadingView.isHidden) == true
                }
                it("should add the viewController and view") {
                    let viewController = UIViewController()
                    async.finish(content: viewController)
                    expect(async.view.subviews).to(contain(viewController.view))
                    expect(viewController.parent).to(equal(async))
                }
            }
        }
    }
}