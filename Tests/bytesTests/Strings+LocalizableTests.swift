//
//  Strings+LocalizableTests.swift
//  
//
//  Created by Thorsten Stark on 30.05.22.
//

import XCTest

class Strings_LocalizableTests: XCTestCase {

    func testSimpleLocalizedWithBundle() throws {
        XCTAssertEqual("test.key".localized(bundle: .module), "it works!")
    }
    
    func testSimpleLocalizedWithCorrectKey() throws {
        XCTAssertEqual("more.key".localized(tableName: "More", bundle: .module), "This works, too.")
    }


}
