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
    init(fixture: Fixture?) {
        self.fixture = fixture
    }
    
    init(fixtureName: String) {
        self.fixture = Fixture(name: fixtureName)
    }
    
    public var fetchedData: Data?
    public var fetchedUrl: URL?
    func fetch(_ url: URL, completion: @escaping DataFetcher.Completion) {
        if let fixture = fixture {
            fetchedUrl = url
            fetchedData = fixture.data
            completion(fixture.data, nil)
        } else {
            completion(nil, RemoteSettings.UpdateError.UnableToFetchData)
        }
    }
}
