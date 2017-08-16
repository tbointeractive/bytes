//
//  RemoteSettings.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

/// Settings that are possibly updated from a remote source.
/// This class is designed to be overridden, especially the `update(_ data: Data) throws` method.
/// There are specialized implementations such as `JSONRemoteSettings` which already parses the JSON data.
open class RemoteSettings {
    
    /// The Completionblock for the update process.
    /// If the error is set no changes have been made.
    /// If the error is nil, the update was performed successful.
    public typealias Completion = ((_ error: Error?)->())
    
    /// The local file URL of the settings.
    public let local: URL?
    
    /// The remote URL of the settings.
    public let remote: URL
    
    /// The DataFetcher to use for remote updates.
    public let fetcher: DataFetcher
    
    /// The DataPersister to store fetched data.
    public let persister: DataStorage
    
    /// Initializes a new RemoteSettings Object.
    ///
    /// - Parameters:
    ///   - remote: The remote URL of the Settings.
    ///   - local: The local URL of the Settings. If set, the settings are initialized with the contents from this file.
    ///   - fetcher: The DataFetcher to use to fetch the data from the remote. If not set, a new NSURLSessionDataFetcher will be used.
    required public init(remote: URL, local: URL? = nil, fetcher: DataFetcher = URLSessionDataFetcher(), persister: DataStorage = DocumentsFolderDataStorage(subfolder: "RemoteSettings")) {
        self.remote = remote
        self.local = local
        self.fetcher = fetcher
        self.persister = persister
        
        var isDataLoaded = false
        if let cachedData = persister.data(forKey: key(for: remote)) {
            do {
                try update(cachedData)
                isDataLoaded = true
            } catch {
                print("Unable to initialize from cached data with error \(error)")
            }
        }
        
        if !isDataLoaded {
            if let localdata = data(fileUrl: local) {
                do {
                    try update(localdata)
                    isDataLoaded = true
                } catch {
                    print("Unable to initialize from local data with error \(error)")
                }
            } else {
                print("No local or cached data found")
            }
        }
    }
    
    /// Updates the Settings from the remote URL.
    /// First it uses the `fetcher` to download the data. This data is then used
    /// with the `update(_ data:) throws` method.
    ///
    /// - Parameter finished: The `Complection` block called if update succeeds or finishes.
    public func update(finished: Completion?) {
        update(remote, finished: finished)
    }
    
    /// Updates itself from a Data object.
    /// This method is called when updating (or initializing) from a local source
    /// or from a remote source.
    ///
    /// When overriding this method do not call `super.update(data)` scince it throws a
    /// `RemoteSettings.UpdateError.UnableToParseData` error.
    ///
    /// - Parameter data: The Data object to update from.
    /// - Throws: Throws errors that can happen while updating, such as parsing errors.
    ///
    /// - Warning: This method should be overridden by subclasses to parse the data, and provide it to the application.
    open func update(_ data: Data) throws {
        throw RemoteSettings.UpdateError.UnableToParseData
    }
    
    /// Updates the Settings from the remote URL.
    /// First it uses the `fetcher` to download the data. This data is then used
    /// with the `update(_ data:) throws` method.
    /// Finally the completion block is called.
    ///
    /// - Parameters:
    ///   - url: The URL where to fetch the data from.
    ///   - finished: The completion block to be called when download is finished.
    private func update(_ url: URL, finished: Completion?) {
        fetcher.fetch(url) { [weak self] data, fetchingError in
            guard let strongSelf = self else { return }
            if let data = data {
                do {
                    try strongSelf.update(data)
                    let dataToPersist = strongSelf.data() ?? data
                    if !strongSelf.persister.store(data: dataToPersist, forKey: url.absoluteString) {
                        print("The DataPersister was unable to store data.")
                    }
                    finished?(nil)
                } catch {
                    finished?(error)
                }
            } else {
                finished?(fetchingError)
            }
        }
    }
    
    /// Loads the data of a local file URL and returns it.
    ///
    /// - Parameter url: The URL of the local file to be loaded.
    /// - Returns: Returns data if it could be loaded.
    private func data(fileUrl url: URL?) -> Data? {
        guard let url = url else { return nil }
        return try? Data(contentsOf: url)
    }
    
    
    /// This function is used to determine the key, for which 
    /// downloaded data will be stored. Returning the same key for
    /// different URLs means data will be overridden. Use this, if the
    /// url changes from time to time and you want to replace the original
    /// data for example if you have to add a get parameter like a cachebuster 
    /// or timestamp.
    ///
    /// Per default the key will be unique for every url.
    ///
    /// - Parameter url: The URL from which the data originates.
    /// - Returns: The key to reference the data.
    open func key(for url: URL) -> String {
        return url.absoluteString
    }
    
    /// After updating the Data from the remote url the persister
    /// is used to store the updated data. The data stored in the 
    /// persisiter is then used to update the RemoteSettings object
    /// upon next instantiation. This method can be used to configure
    /// what data to persist. Per default it will return nil, so the
    /// data from the URL response will be used.
    /// 
    /// This method can be helpful for example, if the data is updated
    /// iteratively, so the URL response will only contain a diff.
    /// In this case you can return the full data here.
    ///
    /// - Returns: The Data that will be persisted and used to update upon instantiation.
    open func data() -> Data? {
        return nil
    }
}


public extension RemoteSettings {
    /// Errors that can happen during the update process.
    enum UpdateError: Error {
        /// It was impossible to fetch the data from the remote source.
        case UnableToFetchData
        /// It was impossible to parse the data.
        case UnableToParseData
    }
}
