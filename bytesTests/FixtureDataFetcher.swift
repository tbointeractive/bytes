//
//  FixtureDataFetcher.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

@testable import bytes
import Foundation

/// This class is used in Specs as a DataFetcher.
/// It returns the data from a fixture ignoring the URL.
/// If no fixture is set, the fetch results in an error.
class FixtureDataFetcher: DataFetcher {
    
    let fixture: Fixture?
    let cached: Fixture?
    init(fixture: Fixture?, cached: Fixture? = nil) {
        self.fixture = fixture
        self.cached = cached
    }
    
    init(fixtureName: String) {
        self.fixture = Fixture(name: fixtureName)
        self.cached = nil
    }
    
    init(fixtureName: String, cachedFixtureName: String) {
        self.fixture = Fixture(name: fixtureName)
        self.cached = Fixture(name: cachedFixtureName)
    }
    
    public var fetchedData: Data?
    public var fetchedUrl: URL?
    func fetch(_ url: URL, completion: @escaping DataFetcher.Completion) {
        guard let fixture = fixture else {
            return completion(nil, RemoteSettings.UpdateError.UnableToFetchData)
        }
        fetchedUrl = url
        fetchedData = fixture.data
        completion(fixture.data, nil)
    }
    
    public var cachedData: Data?
    public var cachedUrl: URL?
    func cached(_ url: URL) -> Data?{
        guard let fixture = cached else { return nil }
        cachedUrl = url
        cachedData = fixture.data
        return fixture.data
    }
}
