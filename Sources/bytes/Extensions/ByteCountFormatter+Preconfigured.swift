//
//  ByteCountFormatterExtensions.swift
//  bytes
//
//  Created by Cornelius Horstmann on 16.11.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension ByteCountFormatter {
    
    /// A ByteCountFormatter with countStyle decimal.
    static let decimal: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .decimal
        return formatter
    }()
    
    /// A ByteCountFormatter with countStyle binary.
    static let binary: ByteCountFormatter = {
        let formatter = ByteCountFormatter()
        formatter.countStyle = .binary
        return formatter
    }()
}
