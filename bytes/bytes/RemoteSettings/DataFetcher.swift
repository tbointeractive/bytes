//
//  DataFetcher.swift
//  bytes
//
//  Created by Cornelius Horstmann on 27.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

/// A protocol for an object that performs fetch requests with a url.
public protocol DataFetcher {
    
    /// A completion block with the fetch result.
    /// If an error occurred the error object is set.
    typealias Completion = ((_ data: Data?, _ error: Error?)->())
    
    /// Fetches the data from a url and calls the completion block with the result.
    ///
    /// - Parameters:
    ///   - url: The url to fetch.
    ///   - completion: The completion block to call whith the result.
    func fetch(_ url: URL, completion: @escaping Completion)
    
    /// Returns cached, existing data if any is cached and not expired.
    ///
    /// - Parameter url: The url for which the Cache should be returned.
    /// - Returns: The chached Data.
    func cached(_ url: URL) -> Data?
}

extension DataFetcher {
    func cached(_ url: URL) -> Data? {
        return nil
    }
}

/// A Data fetcher leveraging URLSession. It only succeeds if the HTTPStatus code
/// is `200`.
class URLSessionDataFetcher: DataFetcher {
    
    /// The URLSession used.
    let session: URLSession
    
    /// Initializes a new URLSessionDataFetcher.
    ///
    /// - Parameter session: The session to use. If not set a new URLSession with default configuration will be used.
    init(session: URLSession? = nil) {
        self.session = session ?? URLSession(configuration: URLSessionConfiguration.default)
    }
    
    /// Fetches the data from a url and calls the completion block with the result.
    ///
    /// - Parameters:
    ///   - url: The url to fetch.
    ///   - completion: The completion block to call whith the result.
    public func fetch(_ url: URL, completion: @escaping DataFetcher.Completion) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    completion(data, nil)
                } else {
                    completion(nil, RemoteSettings.UpdateError.UnableToFetchData)
                }
            }
        }
        task.resume()
    }
    
    /// Returns cached, existing data if any is cached and not expired.
    ///
    /// - Parameter url: The url for which the Cache should be returned.
    /// - Returns: The chached Data.
    func cached(_ url: URL) -> Data? {
        guard let cache = session.configuration.urlCache else { return nil }
        guard let response = cache.cachedResponse(for: URLRequest(url: url)) else { return nil }
        return response.data
    }
}
