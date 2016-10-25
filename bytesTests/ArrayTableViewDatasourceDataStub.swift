//
//  ArrayTableViewDatasourceDataStub.swift
//  bytes
//
//  Created by Cornelius Horstmann on 25.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import UIKit
@testable import bytes

class ArrayTableViewDatasourceDataStub {
    
    var tableView = UITableView()
    var data = ["_specStringA","_specStringB"]
    var createCell: ArrayTableViewDatasource<String>.CreateCell!
    var lastCreateCellCall: (UITableView, IndexPath, String)?
    
    var didSelectCellAt: ((_ indexPath: IndexPath) -> ())!
    var lastDidSelectCellAtCall: IndexPath?
    
    var createHeaderView: ArrayTableViewDatasource<String>.CreateHeaderView!
    var didCallCreateHeaderView = false
    var createFooterView: ArrayTableViewDatasource<String>.CreateFooterView!
    var didCallCreateFooterView = false
    
    init() {
        self.createCell = { (tableView, indexPath, string) -> (UITableViewCell) in
            self.lastCreateCellCall = (tableView, indexPath, string)
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "_specReuseIdentifier")
            cell.textLabel?.text = string
            return cell
        }
        self.didSelectCellAt = { indexPath in
            self.lastDidSelectCellAtCall = indexPath
        }
        self.createHeaderView = { (_,_) in
            self.didCallCreateHeaderView = true
            return nil
        }
        self.createFooterView = { (_,_) in
            self.didCallCreateFooterView = true
            return nil
        }
    }
    
}
