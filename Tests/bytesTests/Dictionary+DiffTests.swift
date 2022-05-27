//
//  Dictionary+DiffTests.swift
//
//
//  Created by Thorsten Stark on 27.05.22.
//

import bytes
import XCTest

class ContentPageTests: XCTestCase {
    
    func testDiffShouldContainUnchangedValues() {
        let source = ["a":"b"]
        let diff = source.diff(to: ["a":"b"])
        XCTAssertNil(diff["a"] as Any?)
    }
    
    func testDiffShouldReturnNilForValuesNotPresentInDestination() {
        let source = ["a":"b"]
        let diff = source.diff(to: [:])
        XCTAssertNil(diff["a"]!)
    }
    
    func testDiffShouldContainChangedValuesComparedToSource() {
        let source = ["a":"b"]
        let diff = source.diff(to: ["a":"c"])
        XCTAssertEqual(diff["a"], "c")
    }
    
    func testDiffShouldContainAddedValuesFromDestination() {
        let source: [String:String] = [:]
        let diff = source.diff(to: ["a":"c"])
        XCTAssertEqual(diff["a"], "c")
    }
}
