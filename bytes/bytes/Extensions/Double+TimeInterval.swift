//
//  Double+TimeInterval.swift
//  bytes
//
//  Created by Cornelius Horstmann on 29.10.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

public extension Double {
    
    /// Returns this Double as TimeInterval in weeks
    var weeks: TimeInterval {
        return days * 7
    }
    
    /// Returns this Double as TimeInterval in days
    var days: TimeInterval {
        return hours * 24
    }
    
    /// Returns this Double as TimeInterval in hours
    var hours: TimeInterval {
        return minutes * 60
    }
    
    /// Returns this Double as TimeInterval in minutes
    var minutes: TimeInterval {
        return seconds * 60
    }
    
    /// Returns this Double as TimeInterval in seconds
    var seconds: TimeInterval {
        return TimeInterval(self)
    }
}

/// These Extensions are just for better grammar.
public extension Double {
    
    /// Returns this Double as TimeInterval in weeks
    var week: TimeInterval {
        return weeks
    }
    
    /// Returns this Double as TimeInterval in days
    var day: TimeInterval {
        return days
    }
    
    /// Returns this Double as TimeInterval in hours
    var hour: TimeInterval {
        return hours
    }
    
    /// Returns this Double as TimeInterval in minutes
    var minute: TimeInterval {
        return minutes
    }
    
    /// Returns this Double as TimeInterval in seconds
    var second: TimeInterval {
        return seconds
    }
}
