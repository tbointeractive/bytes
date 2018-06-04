//
//  Array+shuffle.swift
//  bytes
//
//  Created by Cornelius Horstmann on 13.05.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension NSArray {
    /// Returns a new array with all the value shuffled.
    /// It uses the Fisher-Yates algorithm.
    ///
    /// [source](https://gist.github.com/natecook1000/0ac03efe07f647b46dae)
    public func shuffled() -> NSArray {
        let array = self as Array
        return array.shuffled() as NSArray
    }
    /// Returns a random element of this array
    public var random: Element? {
        get {
            let array = self as Array
            return array.random
        }
    }
}

extension MutableCollection where Self.IndexDistance == Int, Self.Index == Int {
    /// Returns a new array with all the value shuffled.
    /// It uses the Fisher-Yates algorithm.
    ///
    /// [source](https://gist.github.com/natecook1000/0ac03efe07f647b46dae)
    public func shuffled() -> Self {
        var copy = self
        let count = self.count
        for sourceIndex in 0..<(count - 1) {
            let destinationIndex = Int(arc4random_uniform(UInt32(count - sourceIndex))) + sourceIndex
            if sourceIndex != destinationIndex {
                copy.swapAt(sourceIndex, destinationIndex)
            }
        }
        return copy
    }
}

extension Collection where Self.IndexDistance == Int, Self.Index == Int {
    /// Returns a random element of this collection
    public var random: Iterator.Element? {
        get {
            guard count > 0 else { return nil }
            let index = Int(arc4random_uniform(UInt32(count)))
            return self[index]
        }
    }
}
