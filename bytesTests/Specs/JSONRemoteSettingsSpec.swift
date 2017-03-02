//
//  JSONRemoteSettingsSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class JSONRemoteSettingsSpec: QuickSpec {
    override func spec() {
        describe("update(_ data: Data)") {
            context("JSON is a dictionary") {
                let remote = URL(string: "http://tbointeractive.com")!
                let fetcher = FixtureDataFetcher(fixtureName: "json-dictionary")
                let settings = SpecableJSONRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                it("should succeed updating") {
                    settings.update(finished: { (error) in
                        expect(error).to(beNil())
                    })
                }
                it("should parse the data as dictionary") {
                    settings.updateDictionary = nil
                    settings.update(finished: nil)
                    expect(settings.updateDictionary).toNot(beNil())
                }
                it("should not parse an array") {
                    settings.updateArray = nil
                    settings.update(finished: nil)
                    expect(settings.updateArray).to(beNil())
                }
            }
            context("JSON is an array") {
                let remote = URL(string: "http://tbointeractive.com")!
                let fetcher = FixtureDataFetcher(fixtureName: "json-array")
                let settings = SpecableJSONRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                it("should succeed updating") {
                    settings.update(finished: { (error) in
                        expect(error).to(beNil())
                    })
                }
                it("should not parse the data as dictionary") {
                    settings.updateDictionary = nil
                    settings.update(finished: nil)
                    expect(settings.updateDictionary).to(beNil())
                }
                it("should parse an array") {
                    settings.updateArray = nil
                    settings.update(finished: nil)
                    expect(settings.updateArray).toNot(beNil())
                }
            }
            context("JSON is invalid") {
                let remote = URL(string: "http://tbointeractive.com")!
                let fetcher = FixtureDataFetcher(fixtureName: "json-invalid")
                let settings = SpecableJSONRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                it("should not updating") {
                    settings.update(finished: { (error) in
                        expect(error).toNot(beNil())
                    })
                }
                it("should not parse the data as dictionary") {
                    settings.updateDictionary = nil
                    settings.update(finished: nil)
                    expect(settings.updateDictionary).to(beNil())
                }
                it("should parse an array") {
                    settings.updateArray = nil
                    settings.update(finished: nil)
                    expect(settings.updateArray).to(beNil())
                }
            }
        }
    }
}

class SpecableJSONRemoteSettings: JSONRemoteSettings {
    var updateDictionary: [AnyHashable: Any]?
    var updateArray: [Any]?
    open override func update(_ data: [AnyHashable: Any]) throws {
        updateDictionary = data
    }
    open override func update(_ data: [Any]) throws {
        updateArray = data
    }
}
