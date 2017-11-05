//
//  StartupSettings.swift
//  MyWayve
//
//  Created by Dean Parreno on 29/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class StartupSettings: NSObject {
    
    static var conditions: [Condition]? {
        get {
            let savedData = PersistentSettingsManager.array(for: .condition).flatMap { $0 as? [Data] }
            return savedData?.flatMap { NSKeyedUnarchiver.unarchiveObject(with: $0) as? Condition }
        }
        set {
            if let conditions = newValue {
                let conditionsData = conditions.map(NSKeyedArchiver.archivedData(withRootObject:))
                PersistentSettingsManager.setValue(conditionsData as AnyObject, for: .condition)
            } else {
                PersistentSettingsManager.deleteValue(.condition)
            }
        }
    }
    
}
