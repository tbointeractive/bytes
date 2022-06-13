//
//  File.swift
//  
//
//  Created by Thorsten Stark on 09.06.22.
//

import Foundation

public extension UserDefaults {
    
    /// Allows storing a Set<T> in UserDefaults. T must be of a PropertyList type like NSNumber, NSData or NSArray.
    ///
    /// - Discussion
    ///  The Set will be transformed into an array to get stored in UserDefaults.
    ///
    /// - Parameters:
    ///   - newValue: the Set you want to store
    ///   - key: the key identifiying this value in UserDefaults
    func storeSet<T>(_ newValue: Set<T>, forKey key: String) {
        let array: [T] = Array(newValue)
        set(array, forKey: key)
    }
    
    /// Allows reading a previously stored Set<T> from UserDefaults. T must be of a PropertyList type like NSNumber, NSData or NSArray.
    ///
    /// - Discussion
    ///  The Set should be stored in UserDefaults using 'storeSet<T>(_ newValue: Set<T>, forKey key: String)'
    ///
    /// - Parameters:
    ///   - key: the key identifiying this value in UserDefaults
    func readSet<T>(forKey key: String) -> Set<T>? {
        guard let array = array(forKey: key) as? [T] else { return nil }
        let newSet = Set(array)
        return newSet
    }
    
    /// Allows storing a Set<T> in UserDefaults. T must conform to Codabale
    ///
    /// - Discussion
    ///  The Set will be transformed into an array and the stored using 'storeCodableArray<T: Encodable>(_ newValue: [T], forKey key: String)'
    ///
    /// - Parameters:
    ///   - newValue: the Set you want to store. T must conform to Codabale
    ///   - key: the key identifiying this value in UserDefaults
    func storeCodableSet<T: Codable>(_ newValue: Set<T>, forKey key: String) throws {
        let array: [T] = Array(newValue)
        try storeCodableArray(array, forKey: key)
    }
    
    /// Allows reading a previously stored Set<T> from UserDefaults. T must be of a PropertyList type like NSNumber, NSData or NSArray.
    ///
    /// - Discussion
    ///  The Set should be stored in UserDefaults using 'storeCodableSet<T: Codable>(_ newValue: Set<T>, forKey key: String)'
    ///
    /// - Parameters:
    ///   - key: the key identifiying this value in UserDefaults
    func readCodableSet<T: Codable>(forKey key: String) -> Set<T>? {
        guard let array = try? readCodableArray(forKey: key, type: T.self) else { return nil }
        let newSet = Set(array)
        return newSet
    }
    
    /// Allows storing an array of Encodable objects in UserDefaults.
    ///
    /// - Parameters:
    ///   - newValue: the array you want to store. T must conform to Encodable
    ///   - key: the key identifiying this value in UserDefaults
    func storeCodableArray<T: Encodable>(_ newValue: [T], forKey key: String) throws {
        let value = try JSONEncoder().encode(newValue)
        set(value, forKey: key)
    }
    
    // Allows reading a previously stored Array<T> from UserDefaults. T must conform to Decodable
    ///
    /// - Discussion
    ///  The array should be stored in UserDefaults using 'storeCodableArray<T: Encodable>(_ newValue: [T], forKey key: String)'
    ///
    /// - Parameters:
    ///   - key: the key identifiying this value in UserDefaults
    ///   - type: type of the single elements inside the array
    func readCodableArray<T: Decodable>(forKey key: String, type: T.Type) throws -> [T]? {
        guard let data = data(forKey: key) else { return nil }
        let array = try JSONDecoder().decode([T].self, from: data)
        return array
    }
}
