//
//  Fixture.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

struct Fixture {
    public let url: URL
    public var data: Data? {
        get {
            return try? Data(contentsOf: self.url)
        }
    }
    init?(name: String) {
        guard let url = Bundle(for: RemoteSettingsSpec.self).url(forResource: name, withExtension: "fixture") else { return nil }
        self.url = url
    }
}
