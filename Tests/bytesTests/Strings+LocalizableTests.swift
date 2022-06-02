//
//  Strings+LocalizableTests.swift
//  
//
//  Created by Thorsten Stark on 30.05.22.
//

import XCTest

class Strings_LocalizableTests: XCTestCase {

    func testLocalizedWithBundle() throws {
        XCTAssertEqual("test.key".localized(bundle: .module), "it works!")
    }
    
    func testLocalizedWithBundleAndWrongKey() throws {
        XCTAssertEqual("test.unknown.key".localized(bundle: .module), "test.unknown.key")
    }
    
    func testLocalizedWithTableAndBundle() throws {
        XCTAssertEqual("more.key".localized(tableName: "More", bundle: .module), "This works, too.")
    }
    
    func testLocalizedWithWrongTableAndBundle() throws {
        XCTAssertEqual("more.key".localized(tableName: "Unknwon", bundle: .module), "more.key")
    }
    
    func testLocalizedWithTableAndBundleAndWrongKey() throws {
        XCTAssertEqual("more.unknown.key".localized(tableName: "More", bundle: .module), "more.unknown.key")
    }
}
