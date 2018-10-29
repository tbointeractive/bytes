//
//  Double+TimeInterval.swift
//  bytes
//
//  Created by Cornelius Horstmann on 29.10.18.
//  Copyright © 2018 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

extension Double {
    
    /// Returns this Double as TimeInterval in weeks
    public var weeks: TimeInterval {
        return days * 7
    }
    
    /// Returns this Double as TimeInterval in days
    public var days: TimeInterval {
        return hours * 24
    }
    
    /// Returns this Double as TimeInterval in hours
    public var hours: TimeInterval {
        return minutes * 60
    }
    
    /// Returns this Double as TimeInterval in minutes
    public var minutes: TimeInterval {
        return seconds * 60
    }
    
    /// Returns this Double as TimeInterval in seconds
    public var seconds: TimeInterval {
        return TimeInterval(self)
    }
}

/// These Extensions are just for better grammar.
extension Double {
    
    /// Returns this Double as TimeInterval in weeks
    public var week: TimeInterval {
        return weeks
    }
    
    /// Returns this Double as TimeInterval in days
    public var day: TimeInterval {
        return days
    }
    
    /// Returns this Double as TimeInterval in hours
    public var hour: TimeInterval {
        return hours
    }
    
    /// Returns this Double as TimeInterval in minutes
    public var minute: TimeInterval {
        return minutes
    }
    
    /// Returns this Double as TimeInterval in seconds
    public var second: TimeInterval {
        return seconds
    }
}
