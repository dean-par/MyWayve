//
//  StartupSettings.swift
//  MyWayve
//
//  Created by Dean Parreno on 29/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class PersistentSettings: NSObject {
    
    static var conditions: Condition? {
        get {
            guard let savedPerson = UserDefaults.standard.object(forKey: "condition") as? Data else { return nil }
            let decoder = JSONDecoder()
            return try? decoder.decode(Condition.self, from: savedPerson)
        }
        set {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(newValue) {
                UserDefaults.standard.set(data, forKey: "condition")
            }
        }
    }
}
