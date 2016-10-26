//
//  ArrayTableViewDatasourceSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 25.10.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class ArrayTableViewDatasourceSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should be possible to initialize a datasource with an empty array") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: [], createCell: dataStub.createCell)
                expect(datasource).toNot(beNil())
            }
            it("should be possible to initialize a datasource with an array of strings") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                expect(datasource).toNot(beNil())
            }
        }
        
        describe("numberOfSections") {
            it("should return the number of arrays in the data array") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                expect(datasource.numberOfSections(in: dataStub.tableView)).to(equal(dataStub.data.count))
            }
        }
        
        describe("numberOfRowsInSection") {
            it("should return the size of the section-array") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                expect(datasource.tableView(dataStub.tableView, numberOfRowsInSection: 0)).to(equal(dataStub.data[0].count))
            }
            it("should return 0 for every section > data.count") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                expect(datasource.tableView(dataStub.tableView, numberOfRowsInSection: dataStub.data.count)).to(equal(0))
            }
        }
        
        describe("cellForRowAtIndexPath") {
            it("should call the correct closure") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                let indexPath = IndexPath(row: 1, section: 0)
                let _ = datasource.tableView(dataStub.tableView, cellForRowAt: indexPath)
                expect(dataStub.lastCreateCellCall).toNot(beNil())
                let (calledTableView, calledIndexPath, calledString) = dataStub.lastCreateCellCall!
                expect(calledTableView).to(equal(dataStub.tableView))
                expect(calledIndexPath).to(equal(indexPath))
                expect(calledString).to(equal(dataStub.data[indexPath.section][indexPath.row]))
            }
            // This test doesn't work. I thought is should, considering https://github.com/Quick/Nimble#swift-assertions
//            it("should throw a fatal error if the indexPath is out of bounds") {
//                let dataStub = ArrayTableViewDatasourceDataStub()
//                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
//                let indexPath = IndexPath(row: 2, section: 0)
//                expect { let _ = datasource.tableView(dataStub.tableView, cellForRowAt: indexPath); return nil}.to(throwAssertion())
//            }
        }
        
        describe("didSelectRowAtIndexPath") {
            it("should call the closure if set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                let indexPath = IndexPath(row: 1, section: 0)
                datasource.didSelectCellAt = dataStub.didSelectCellAt
                datasource.tableView(dataStub.tableView, didSelectRowAt: indexPath)
                expect(dataStub.lastDidSelectCellAtCall).toNot(beNil())
                expect(dataStub.lastDidSelectCellAtCall).to(equal(indexPath))
            }
            it("should not crash if the closure is not set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                let indexPath = IndexPath(row: 1, section: 0)
                datasource.tableView(dataStub.tableView, didSelectRowAt: indexPath)
            }
        }
        
        describe("viewForHeaderInSection") {
            it("should call the closure if set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                datasource.createHeaderView = dataStub.createHeaderView
                let _ = datasource.tableView(dataStub.tableView, viewForHeaderInSection: 0)
                expect(dataStub.didCallCreateHeaderView).to(beTrue())
            }
            it("should not crash if the closure is not set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                let _ = datasource.tableView(dataStub.tableView, viewForHeaderInSection: 0)
            }
        }
        
        describe("viewForFooterInSection") {
            it("should call the closure if set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                datasource.createFooterView = dataStub.createFooterView
                let _ = datasource.tableView(dataStub.tableView, viewForFooterInSection: 0)
                expect(dataStub.didCallCreateFooterView).to(beTrue())
            }
            it("should not crash if the closure is not set") {
                let dataStub = ArrayTableViewDatasourceDataStub()
                let datasource = ArrayTableViewDatasource(data: dataStub.data, createCell: dataStub.createCell)
                let _ = datasource.tableView(dataStub.tableView, viewForFooterInSection: 0)
            }
        }
    }
}
