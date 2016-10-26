//
//  ArrayDatasource.swift
//  bytes
//
//  Created by Cornelius Horstmann on 25.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation
import UIKit

/// A UITableViewDatasource that displays data from an Array
/// Features:
/// - every array in the data array represents one section
/// - every item in every array in the data array represents one row
/// - it has optional section header and footer
/// - it has a closure that is invoked if the user tapps a cell
///
/// To use all features the tableView must be setup to use this as dataSource and delegate.
/// The delegate is necessary for cell selection and custom header and footer views
public class ArrayTableViewDatasource<DataType>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public typealias CreateCell = (_ tableView: UITableView, _ indexPath: IndexPath, _ data: DataType) -> (UITableViewCell)
    public typealias CreateHeaderView = (_ tableView: UITableView, _ section: Int) -> (UIView?)
    public typealias CreateFooterView = (_ tableView: UITableView, _ section: Int) -> (UIView?)

    private let data: [[DataType]]
    private let createCell: CreateCell
    
    /// This closure is invoked when the user selects the cell at an indexPath
    public var didSelectCellAt: ((_ indexPath: IndexPath) -> ())? = nil
    
    // If this closure is set it is used to display a section header
    public var createHeaderView: CreateHeaderView? = nil
    
    // If this closure is set it is used to display a section footer
    public var createFooterView: CreateFooterView? = nil
    
    /// Initializes a new Datasource with the data array
    /// and a closure that returns a cell for a certain
    /// index path
    ///
    /// - parameter data:       an array of data that is used to display
    /// - parameter createCell: a closure that must return the UITableViewCell for that indexPath
    ///
    /// - returns: a new datasource
    init(data: [[DataType]], createCell: @escaping CreateCell) {
        self.data = data
        self.createCell = createCell
    }
    
    // MARK: UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard data.count > section else { return 0 }
        return data[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard data.count > indexPath.section &&
            data[indexPath.section].count > indexPath.row else { fatalError("index out of bounds") }
        let dataObject = data[indexPath.section][indexPath.row]
        return createCell(tableView, indexPath, dataObject)
    }
    
    // MARK: UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectCellAt?(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return createHeaderView?(tableView, section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return createFooterView?(tableView, section)
    }
    
}
