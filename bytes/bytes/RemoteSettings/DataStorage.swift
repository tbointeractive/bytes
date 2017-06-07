//
//  DataStorage.swift
//  bytes
//
//  Created by Cornelius Horstmann on 05.06.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public protocol DataStorage {
    
    /// Stores the data for a given url. If succeeds it should never remove stored data.
    /// Data can only be overridden with new data for the same url.
    ///
    /// - Parameters:
    ///   - data: The data to store
    ///   - key: The key as a context to store the data
    ///
    /// - Returns: True if the data was stored.
    func store(data: Data, forKey key: String) -> Bool
    
    /// Retrieves stored data given a url.
    ///
    /// - Parameters:
    ///   - url: The key as a context the searched data was stored with
    /// - Returns: Stored data if any
    func data(forKey key: String) -> Data?
}

open class FileDataStorage: DataStorage {
    
    let baseUrl: URL
    
    public required init(baseUrl: URL) {
        self.baseUrl = baseUrl
        do {
            try FileManager.default.createDirectory(at: baseUrl, withIntermediateDirectories: true, attributes: nil)
        }
        catch {
            print("\(error)")
        }
    }
    
    public func store(data: Data, forKey key: String) -> Bool {
        let fileUrl = baseUrl.appendingPathComponent(key.md5)
        
        do {
            try data.write(to: fileUrl, options: .atomic)
            return true
        }
        catch {
            print("\(error)")
            return false
        }
    }
    
    public func data(forKey key: String) -> Data? {
        let fileUrl = baseUrl.appendingPathComponent(key.md5)
        do {
            return try Data(contentsOf: fileUrl)
        }
        catch {
            print("\(error)")
            return nil
        }
    }
}

final class DocumentsFolderDataStorage: FileDataStorage {
    
    convenience init(subfolder: String) {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let baseUrl = URL(fileURLWithPath: documentsPath, isDirectory: true).appendingPathComponent(subfolder)
        self.init(baseUrl: baseUrl)
    }
}
