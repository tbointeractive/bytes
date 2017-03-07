//
//  Int+Random.swift
//  bytes
//
//  Created by Thorsten Stark on 23.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension Int {
    
    /// Returns a random integer value within the given range
    ///
    /// - Parameter range: A range the radom number should be in
    /// - Returns: A random Int value
    public static func random(in range: Range<Int>) -> Int {
        guard !range.isEmpty else { return 0}
        let rangeSize = range.upperBound - range.lowerBound
        let randomNumber = Int(arc4random_uniform(UInt32(rangeSize)))
        return randomNumber + range.lowerBound
    }
}
