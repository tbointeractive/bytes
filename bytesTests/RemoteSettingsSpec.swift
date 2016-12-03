//
//  RemoteSettingsSpec.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes

import Quick
import Nimble

class RemoteSettingsSpec: QuickSpec {
    override func spec() {
        describe("init") {
            it("should return a new RemoteSetting with just a remote url") {
                let setting = RemoteSettings(remote: URL(string: "http://tbointeractive.com")!)
                expect(setting).toNot(beNil())
            }
            it("should use the NSURLSessionDataFetcher per default") {
                let setting = RemoteSettings(remote: URL(string: "http://tbointeractive.com")!)
                expect(setting.fetcher as? URLSessionDataFetcher).toNot(beNil())
            }
            it("should initialize data if there is a local file url") {
                let fetcher = FixtureDataFetcher(fixture: Fixture(name: "json"))
                let remote = URL(string: "http://tbointeractive.com")!
                let setting = SpecableRemoteSettings(remote: remote, local: fetcher.fixture?.url, fetcher: fetcher)
                expect(setting.updateData).toNot(beNil())
            }
            it("doesn't perform an update") {
                let fetcher = FixtureDataFetcher(fixture: Fixture(name: "json"))
                let remote = URL(string: "http://tbointeractive.com")!
                let _ = SpecableRemoteSettings(remote: remote, local: fetcher.fixture?.url, fetcher: fetcher)
                expect(fetcher.fetchedData).to(beNil())
            }
            it("should priorize data from cache over local data") {
                let fetcher = FixtureDataFetcher(fixtureName: "json-array", cachedFixtureName: "json-dictionary")
                let remote = URL(string: "http://tbointeractive.com")!
                let settings = SpecableRemoteSettings(remote: remote, local: fetcher.fixture?.url, fetcher: fetcher)
                expect(settings.updateData).to(equal(fetcher.cached?.data))
                expect(settings.updateData).toNot(equal(fetcher.fixture?.data))
            }
        }
        describe("update") {
            it("should fetch the data via the fetcher") {
                let fetcher = FixtureDataFetcher(fixtureName: "json")
                let remote = URL(string: "http://tbointeractive.com")!
                let setting = SpecableRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                setting.update(finished: { (error) in
                    expect(error).to(beNil())
                    expect(fetcher.fetchedUrl).to(equal(remote))
                })
            }
            it("should update itself via the fetched data") {
                let fetcher = FixtureDataFetcher(fixtureName: "json")
                let remote = URL(string: "http://tbointeractive.com")!
                let setting = SpecableRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                setting.update(finished: { (error) in
                    expect(error).to(beNil())
                    expect(setting.updateData).to(equal(fetcher.fetchedData))
                })
            }
            it("should return an error if the fetcher doesn't succeed") {
                let fetcher = FixtureDataFetcher(fixture: nil)
                let remote = URL(string: "http://tbointeractive.com")!
                let setting = SpecableRemoteSettings(remote: remote, local: nil, fetcher: fetcher)
                setting.update(finished: { (error) in
                    expect(error).toNot(beNil())
                })
            }
        }
    }
}

class SpecableRemoteSettings: RemoteSettings {
    var updateData: Data?
    override func update(_ data: Data) throws {
        updateData = data
    }
}
