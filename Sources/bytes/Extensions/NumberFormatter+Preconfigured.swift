//
//  NumberFormatterExtension.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension NumberFormatter {
    
    /// A decimal NumberFormatter with maximumFractionDigits = 1.
    @objc static let decimalSingleDigit = decimal(fractionDigits: 1)
    
    /// A decimal NumberFormatter with maximumFractionDigits = 2.
    @objc static let decimalDoubleDigit = decimal(fractionDigits: 2)
    
    /// Creates and returns a new decimal NumberFormatter.
    ///
    /// - Parameter fractionDigits: The maximumFractionDigits of the new NumberFormatter.
    /// - Returns: A new NumberFormatter.
    @objc static func decimal(fractionDigits: Int) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = fractionDigits
        return formatter
    }
}
