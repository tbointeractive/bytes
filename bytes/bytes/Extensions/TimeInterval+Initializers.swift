//
//  TimeInterval+Initializers.swift
//  bytes
//
//  Created by Pascal Stüdlein on 28.11.17.
//  Copyright © 2017 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension TimeInterval {
    init(days: Double) {
        self.init(hours: 24 * days)
    }
    
    init(hours: Double) {
        self.init(minutes: 60 * hours)
    }
    
    init(minutes: Double) {
        self = 60 * minutes
    }
}
