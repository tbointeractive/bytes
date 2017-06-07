//
//  FileDataStorageSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 05.06.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Foundation
import Quick
import Nimble

class FileDataStorageSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should create the folder if it doesn't exist") {
                let baseUrl = self.tempUrl(name: "FileDataStorageSpec_init")
                if FileManager.default.fileExists(atPath: baseUrl.path) {
                    try! FileManager.default.removeItem(at: baseUrl)
                }
                expect(FileManager.default.fileExists(atPath: baseUrl.path)).to(beFalse())
                let _ = FileDataStorage(baseUrl: baseUrl)
                expect(FileManager.default.fileExists(atPath: baseUrl.path)).to(beTrue())
            }
        }
        describe("store") {
            let baseUrl = self.tempUrl(name: "FileDataStorageSpec_store")
            it("should return true if the data was stored") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                let success = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                expect(success).to(beTrue())
            }
            it("should return false if the data couldn't be stored") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                try! FileManager.default.removeItem(at: baseUrl)
                let success = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                expect(success).to(beFalse())
            }
            it("should store the data so it is retrievable with the data function") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                let _ = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                expect(storage.data(forKey: fixture.url.absoluteString)).to(equal(fixture.data!))
            }
            it("should override existing stored data") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                let secondFixture = Fixture(name: "json-dictionary")!
                let _ = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                let _ = storage.store(data: secondFixture.data!, forKey: fixture.url.absoluteString)
                expect(storage.data(forKey: fixture.url.absoluteString)).to(equal(secondFixture.data!))
                expect(storage.data(forKey: fixture.url.absoluteString)).toNot(equal(fixture.data!))
            }
            it("should not override data if the url is different") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                let secondFixture = Fixture(name: "json-dictionary")!
                let _ = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                let _ = storage.store(data: secondFixture.data!, forKey: secondFixture.url.absoluteString)
                expect(storage.data(forKey: secondFixture.url.absoluteString)).to(equal(secondFixture.data!))
                expect(storage.data(forKey: fixture.url.absoluteString)).to(equal(fixture.data!))
            }
        }
        describe("data") {
            let baseUrl = self.tempUrl(name: "FileDataStorageSpec_data")
            it("should return the stored data") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let fixture = Fixture(name: "json-array")!
                let _ = storage.store(data: fixture.data!, forKey: fixture.url.absoluteString)
                expect(storage.data(forKey: fixture.url.absoluteString)).to(equal(fixture.data!))
            }
            it("should return nil if no data was stored") {
                let storage = FileDataStorage(baseUrl: baseUrl)
                let nonexistentUrl = URL(string: "noDataStoredForThisUrl")!
                expect(storage.data(forKey: nonexistentUrl.absoluteString)).to(beNil())
            }
        }
    }
    
    private func tempUrl(name: String) -> URL {
        let tempDirectoryTemplate = NSTemporaryDirectory()
        return URL(fileURLWithPath: tempDirectoryTemplate, isDirectory: true).appendingPathComponent(name)
    }
}
