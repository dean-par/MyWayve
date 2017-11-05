//
//  PersistentSettingsManager.swift
//  MyWayve
//
//  Created by Dean Parreno on 22/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class PersistentSettingsManager: DefaultsHandlerType {
    
    /// Keys used by NSUserDefaults and Keychain. If value of key is the same as the enum name, value does not need to
    /// be defined, because `.rawValue` of the enum will result in String of the enum name.
    enum Key: String {
        case condition
    }
    
    // MARK: Computed properties
    
    /// Abbreviation for NSUserDefaults.
    static var defaults: UserDefaults {
        return UserDefaults.standard
    }
    
    static func deleteValue(_ key: PersistentSettingsManager.Key) {
        defaults.removeObject(forKey: key.rawValue)
    }
    
}
