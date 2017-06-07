//
//  FixtureDataPersister.swift
//  bytes
//
//  Created by Cornelius Horstmann on 05.06.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation
@testable import bytes

class TemporaryDataStorage: FileDataStorage {
    
    convenience init(subfolder: String) {
        let tempDirectoryTemplate = NSTemporaryDirectory()
        let baseUrl = URL(fileURLWithPath: tempDirectoryTemplate, isDirectory: true).appendingPathComponent(subfolder)
        self.init(baseUrl: baseUrl)
    }

    public func storeData(from fixture: Fixture, for url: URL) -> Bool {
        guard let data = fixture.data else { return false }
        return store(data: data, forKey: url.absoluteString)
    }
}
