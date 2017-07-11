//
//  AsyncViewController.swift
//  bytes
//
//  Created by Cornelius Horstmann on 17.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit

/// The AsyncViewContoller helps you to display a ViewController that has to be loaded
/// and can fail to load like (but not limited to) network requests.
/// You can subclass this ViewController and customize the loading and error state to be
/// consitent throughout your app.
///
///     let asyncViewController = AsyncViewController() { async in
///         DispatchQueue.global(qos: .userInitiated).async {
///             // performing async calculations
///             let success = true
///             DispatchQueue.main.async {
///                 if success {
///                     // create the ViewController and display it
///                     let newViewController = UIViewController()
///                     async.finish(content: newViewController)
///                 } else {
///                     // set the error
///                     async.fail(error)
///                 }
///             }
///         }
///     }
///     present(asyncViewController, animated: true, completion: nil)
///
/// - ToDo: We should add a method to show some kind of progress.
open class AsyncViewController: UIViewController {
    
    public typealias CancelClosure = () -> Void
    public typealias LoadClosure = (_ async: AsyncViewController) -> (CancelClosure?)
    
    /// The state the AsyncViewController is currently in.
    public private(set) var state: State
    
    /// The view displayed during loading state.
    /// - Remark: You can override this property in a subclass.
    open var loadingView: UIView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    private var errorView: UIView?
    
    private var contentViewController: UIViewController? = nil {
        didSet {
            if let contentViewController = oldValue {
                contentViewController.navigationItem.removeObserver(self, forKeyPath: "rightBarButtonItems")
                contentViewController.navigationItem.removeObserver(self, forKeyPath: "rightBarButtonItem")
            }
            if let contentViewController = contentViewController {
                contentViewController.navigationItem.addObserver(self, forKeyPath: "rightBarButtonItems", options: [], context: nil)
                contentViewController.navigationItem.addObserver(self, forKeyPath: "rightBarButtonItem", options: [], context: nil)
            }
        }
    }
    
    /// Returns an error view for a given error. The view will be added as a subview and
    /// constrained to the edges of the view of the AsyncViewController.
    /// - Remark: You can override this property in a subclass. When overriding
    ///   you can reuse the same view again.
    ///
    /// - Parameter error: The error that has been passed into the `fail()` method.
    /// - Returns: Returns a View that should be displayed in the error state.
    open func errorView(_ error: Error?) -> UIView {
        let label = UILabel(frame: CGRect.zero)
        label.text = error?.localizedDescription ?? ""
        return label
    }
    
    private var load: LoadClosure?
    
    /// The cancelClosure is exectued when the AsyncViewController is deinitalized
    /// or the cancel() function is called
    private var cancelClosure: CancelClosure?
    
    deinit {
        if let contentViewController = self.contentViewController {
            contentViewController.navigationItem.removeObserver(self, forKeyPath: "rightBarButtonItems")
            contentViewController.navigationItem.removeObserver(self, forKeyPath: "rightBarButtonItem")
        }
        cancelClosure?()
    }
    
    /// Initializes a new AsyncViewController.
    ///
    /// - Parameter load: The closure that should be executed to perform the asynchronous process.
    ///   Expect the closure to be called multiple times due to retries for example. The load
    ///   closure should will be called from the main thread and should not block it. It will be
    ///   called automatically on `viewWillAppear`.
    /// - Returns: Returns an optional CancelClosure which is executed when the AsyncViewController
    ///   is deinitalized or the cancel function is called. Use the callback for cancelling
    ///   the active process. E.g. a running network request should be cancelled.
    public init(load: @escaping LoadClosure) {
        self.load = load
        self.state = .idle
        super.init(nibName: nil, bundle: nil)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loadingView)
        loadingView.constrainEdges(to: view)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        start()
    }
    
    /// Starts the loading process and configures a loading view. Can be called to retry the current process.
    /// When the AsyncViewController is not in the idle or error state this call will be ignored.
    public func start() {
        guard [.idle, .error].contains(state) else { return }
        state = .loading
        errorView?.removeFromSuperview()
        loadingView.isHidden = false
        cancelClosure = load?(self)
    }
    
    /// Sets the state to .idle and calls the cancelClosure for cancelling the current process.
    /// It will not change the visibility of the loading or error view.
    public func cancel() {
        state = .idle
        cancelClosure?()
    }
    
    /// Finishes the loading process and displays the resulting ViewController.
    /// Call this method once your asynchronous process has finished.
    /// When the AsyncViewController is not in the loading state this call will be ignored.
    ///
    /// - Parameter contentViewController: The ViewController to display.
    public func finish(content contentViewController: UIViewController) {
        guard [.loading].contains(state) else { return }
        state = .finished
        loadingView.isHidden = true
        load = nil
        cancelClosure = nil
        self.contentViewController = contentViewController
        addChildViewController(contentViewController, constrainEdgesTo: view)
    }
    
    /// Sets the process as being failed and displays an error view.
    /// When the AsyncViewController is not in the loading state this call will be ignored.
    ///
    /// - Parameter error: The error that happened and for which an error view should be displayed.
    public func fail(_ error: Error?) {
        guard [.loading].contains(state) else { return }
        self.state = .error
        loadingView.isHidden = true
        let errorView = self.errorView(error)
        self.errorView = errorView
        view.addSubview(errorView)
        errorView.constrainEdges(to: view)
    }
    
    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rightBarButtonItems",
            let navigationItem = object as? UINavigationItem {
            self.navigationItem.rightBarButtonItems = navigationItem.rightBarButtonItems
        } else if keyPath == "rightBarButtonItem",
            let navigationItem = object as? UINavigationItem {
            self.navigationItem.rightBarButtonItem = navigationItem.rightBarButtonItem
        }
    }
    
    // MARK: NSCoding
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("this object is not NSCoding compliant")
    }
    
    override open func encode(with aCoder: NSCoder) {
        fatalError("this object is not NSCoding compliant")
    }
}

public extension AsyncViewController {
    /// The state of an AsyncViewController
    ///
    /// - idle: The initial state.
    /// - loading: The loading closure is currently performed.
    /// - finished: The loading closure finished. The final ViewController is being displayed.
    /// - error: The loading closure failed. An error view is being displayed.
    public enum State {
        case idle
        case loading
        case finished
        case error
    }
}
