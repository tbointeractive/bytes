//
//  String+Localizable.swift
//  
//
//  Created by Thorsten Stark on 30.05.22.
//

import Foundation


public extension String {
    
    /// A wrapper for NSLocalizedString assuming that self ist the key inside the localizable.strings file.
    ///
    ///Example:
    ///```
    /// "alert.missing-data.title".localized(comment: "Titel for missing image data alert.")
    /// "alert.missing-data.text".localized()
    ///```
    ///
    /// - parameter tableName: The name of the .strings file that contains the localized string identified by the key
    ///
    /// - parameter bundle: The bundle in which the .strings file is located
    ///
    /// - parameter comment: A String representing a comment to give more context about the localized string
    ///
    /// - Returns: The localized String or the key itself when no localization for this key was found
    func localized(tableName: String? = nil, bundle: Bundle = Bundle.main, comment: String = "") -> String {
        NSLocalizedString(self,tableName: tableName, bundle: bundle, comment: comment)
    }
}
