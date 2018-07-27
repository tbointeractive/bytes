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
    @available(*, deprecated, message: "Use the random() function instead")
    public static func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
}
