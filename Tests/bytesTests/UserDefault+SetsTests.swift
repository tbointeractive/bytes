//
//  UserDefault+SetsTests.swift
//  
//
//  Created by Thorsten Stark on 09.06.22.
//

import XCTest

class UserDefault_SetsTests: XCTestCase {
    
    private var defaults: UserDefaults?
    
    override func setUpWithError() throws {
        defaults = UserDefaults(suiteName: "UserDefault_SetsTests")!
        
    }
    
    override func tearDownWithError() throws {
        resetDefaults()
        defaults?.removeSuite(named: "UserDefault_SetsTests")
    }
    
    private func resetDefaults() {
        defaults?.dictionaryRepresentation().keys.forEach { key in
            defaults?.removeObject(forKey: key)
        }
    }
    
    //MARK: - test storeSet
    
    func testStoringASetOfIntegers() throws {
        let testSet: Set<Int> = [1,3]
        defaults?.storeSet(testSet, forKey: "testStoringASetOfIntegers")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringASetOfIntegers"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringASetOfIntegers") as? [Int])?.count, 2)
    }
    
    func testStoringASetOfStrings() throws {
        let testSet: Set<String> = ["foo", "bar"]
        defaults?.storeSet(testSet, forKey: "testStoringASetOfStrings")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringASetOfStrings"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringASetOfStrings") as? [String])?.count, 2)
    }
    
    func testStoringASetOfArrays() throws {
        let testSet: Set<[Int]> = [[1,1,1], [3]]
        defaults?.storeSet(testSet, forKey: "testStoringASetOfArrays")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringASetOfArrays"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringASetOfArrays") as? [[Int]])?.count, 2)
    }
    
    func testStoringAndRetrievingASetOfIntegers() throws {
        let testSet: Set<Int> = [1,3]
        defaults?.storeSet(testSet, forKey: "testStoringAndRetrievingASetOfIntegers")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringAndRetrievingASetOfIntegers"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringAndRetrievingASetOfIntegers") as? [Int])?.count, 2)
        let retrievedSet: Set<Int> = defaults?.readSet(forKey: "testStoringAndRetrievingASetOfIntegers") ?? []
        XCTAssertEqual(retrievedSet, testSet)
    }
    
    func testStoringAndRetrievingASetOfStrings() throws {
        let testSet: Set<String> = ["foo", "bar"]
        defaults?.storeSet(testSet, forKey: "testStoringASetOfStrings")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringASetOfStrings"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringASetOfStrings") as? [String])?.count, 2)
        guard let retrievedSet: Set<String> = defaults?.readSet(forKey: "testStoringASetOfStrings") else { return XCTFail("Array could not get loaded") }
        XCTAssertEqual(retrievedSet, testSet)
    }
    
    func testStoringAndRetrievingASetOfArrays() throws {
        let testSet: Set<[Int]> = [[1,1,1], [3]]
        defaults?.storeSet(testSet, forKey: "testStoringASetOfArrays")
        XCTAssertNotNil(defaults?.object(forKey:"testStoringASetOfArrays"))
        XCTAssertEqual((defaults?.object(forKey: "testStoringASetOfArrays") as? [[Int]])?.count, 2)
        guard let retrievedSet: Set<[Int]> = defaults?.readSet(forKey: "testStoringASetOfArrays") else { return XCTFail("Array could not get loaded") }
        XCTAssertEqual(retrievedSet, testSet)
    }
    
    //MARK: - test storeCodableSet
    
    func testStoringACodableSetOfCodable() throws {
        let testSet: Set<TestStruct> = [TestStruct(value: 2), TestStruct(value: 3)]
        XCTAssertNoThrow(try defaults?.storeCodableSet(testSet, forKey: "testStoringACodableSetOfCodable"))
        XCTAssertNotNil(defaults?.object(forKey:"testStoringACodableSetOfCodable") as? Data)
    }
    
    func testStoringAndRetrievingACodableSetOfCodable() throws {
        let testSet: Set<TestStruct> = [TestStruct(value: 2), TestStruct(value: 3)]
        XCTAssertNoThrow(try defaults?.storeCodableSet(testSet, forKey: "testStoringAndRetrievingACodableSetOfCodable"))
        XCTAssertNotNil(defaults?.object(forKey:"testStoringAndRetrievingACodableSetOfCodable"))
        XCTAssertEqual(defaults?.readCodableSet(forKey: "testStoringAndRetrievingACodableSetOfCodable"), testSet)
    }
    
    //MARK: - test storeCodableArray
    
    func testStoringACodableArray() throws {
        let testSet: [TestStruct] = [TestStruct(value: 2), TestStruct(value: 3)]
        XCTAssertNoThrow(try defaults?.storeCodableArray(testSet, forKey: "testStoringACodableArray"))
        XCTAssertNotNil(defaults?.object(forKey:"testStoringACodableArray") as? Data)
    }
    
    func testStoringAndReadingACodableArray() throws {
        let testSet: [TestStruct] = [TestStruct(value: 2), TestStruct(value: 3)]
        XCTAssertNoThrow(try defaults?.storeCodableArray(testSet, forKey: "testStoringAndReadingACodableArray"))
        XCTAssertNotNil(defaults?.object(forKey:"testStoringAndReadingACodableArray") as? Data)
        do {
            let retrievedSet = try defaults?.readCodableArray(forKey: "testStoringAndReadingACodableArray", type: TestStruct.self) as? [TestStruct]
            XCTAssertEqual(retrievedSet, testSet)
        } catch {
            debugPrint(error)
            XCTFail(error.localizedDescription)
        }
        
    }
    
    func testStoringAndReadingAcodableStringArray() throws {
        let testSet: [String] = ["foo", "bar"]
        XCTAssertNoThrow(try defaults?.storeCodableArray(testSet, forKey: "testStoringAndReadingAcodableStringArray"))
        XCTAssertNotNil(defaults?.object(forKey:"testStoringAndReadingAcodableStringArray") as? Data)
        do {
            let retrievedSet = try defaults?.readCodableArray(forKey: "testStoringAndReadingAcodableStringArray", type: String.self) as? [String]
            XCTAssertEqual(retrievedSet, testSet)
        } catch {
            debugPrint(error)
            XCTFail(error.localizedDescription)
        }
        
    }
}

fileprivate struct TestStruct: Codable, Hashable {
    let value: Int
}


