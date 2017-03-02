//
//  Bool+Random.swift
//  bytes
//
//  Created by Thorsten Stark on 23.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension Bool {
    
    /// Returns a random bool value
    ///
    /// - Returns: A random bool value
    public static func random() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
