//
//  SemanticVersion
//  bytes
//
//  Created by Cornelius Horstmann on 11.12.16.
//  Copyright © 2016 TBO INTERACTIVE GmbH & Co. KG. All rights reserved.
//

import Foundation

/// Represents a Version as defined at http://semver.org.
/// Can parse a SemanticVersion from a string and serialize to it.
/// Implements `Equatable` and `Compareable` as defined at http://semver.org.
public struct SemanticVersion {
    public let major: Int8
    public let minor: Int8
    public let patch: Int8
    
    /// All additional prerelease identifiers.
    public let prereleaseIdentifiers: [String]
    
    /// Initializes a new SemanticVersion with major, minor and patch versions aswell as additional prerelease idenfifiers.
    ///
    /// - Parameters:
    ///   - major: The major version.
    ///   - minor: The minor version. Default = 0
    ///   - patch: The patch version. Default = 0
    ///   - prereleaseIdentifiers: All aditional prereleaseIdentifiers. Default = none.
    init(major: Int8, minor: Int8?, patch: Int8?, prereleaseIdentifiers: [String] = []) {
        self.major = major
        self.minor = minor ?? 0
        self.patch = patch ?? 0
        self.prereleaseIdentifiers = prereleaseIdentifiers
    }
    
    /// Initializes a new SemanticVersion with a string. Valid, parseable strings are defined at http://semver.org
    /// Non-defined minor and patch versions are defaulting to 0.
    ///
    /// - Parameters:
    ///   - string: The string to parse.
    init?(_ string: String) {
        let basic: [String] = string.trimmingCharacters(in: .whitespaces).components(separatedBy: "-")
        let components = basic[0].components(separatedBy: ".")
        guard let major = Int8(components[0]) else { return nil }
        let minor = components.count > 1 ? Int8(components[1]) : nil
        let patch = components.count > 2 ? Int8(components[2]) : nil
        let prereleaseIdentifiers = basic.count > 1 ? basic[1].components(separatedBy: ".") : []
        self.init(major: major, minor: minor, patch: patch, prereleaseIdentifiers: prereleaseIdentifiers)
    }
}

extension SemanticVersion: CustomStringConvertible {
    /// Returns the version as a string. Will always contain minor and major, even if they are zero.
    /// Will not contain a hyphen if there are no prereleaseIdentifiers.
    public var description: String {
        get {
            guard prereleaseIdentifiers.count > 0 else {
                return "\(major).\(minor).\(patch)"
            }
            return "\(major).\(minor).\(patch)-\(prereleaseIdentifiers.joined(separator: "."))"
        }
    }
}

extension SemanticVersion: Equatable {
    public static func ==(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch && lhs.prereleaseIdentifiers == rhs.prereleaseIdentifiers
    }
}

extension SemanticVersion: Comparable {
    public static func <(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        if lhs == rhs { return false }
        if lhs.major > rhs.major { return false }
        if lhs.major == rhs.major && lhs.minor > rhs.minor { return false }
        if lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch > rhs.patch { return false }

        if lhs.prereleaseIdentifiers.count == 0 && rhs.prereleaseIdentifiers.count > 0 {
            return false
        }
        if rhs.prereleaseIdentifiers.count == 0 && lhs.prereleaseIdentifiers.count > 0 {
            return true
        }
        
        for (index,label) in lhs.prereleaseIdentifiers.enumerated() {
            guard rhs.prereleaseIdentifiers.count > index else {
                // A larger set of pre-release fields has a higher precedence than a smaller set, if all of the preceding identifiers are equal.
                return false
            }
            let otherLabel = rhs.prereleaseIdentifiers[index]
            if let labelInt = Int8(label) {
                if let otherLabelInt = Int8(otherLabel) {
                    if labelInt < otherLabelInt {
                        // identifiers consisting of only digits are compared numerically
                        return true
                    } else if labelInt > otherLabelInt {
                        return false
                    }
                } else {
                    // Numeric identifiers always have lower precedence than non-numeric identifiers.
                    return true
                }
            } else {
                if Int8(otherLabel) != nil {
                    return false
                } else {
                    if label > otherLabel {
                        // identifiers with letters or hyphens are compared lexically in ASCII sort order.
                        return false
                    } else if label < otherLabel {
                        return true
                    }
                }
            }
        }
        return true
    }
    public static func >(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return rhs < lhs
    }
    public static func <=(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return lhs < rhs || lhs == rhs
    }
    public static func >=(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        return lhs > rhs || lhs == rhs
    }
}
