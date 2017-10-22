//
//  Condition.swift
//  MyWayve
//
//  Created by Dean Parreno on 22/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class Condition {
    
    // Chagen to CLLocationCoordinate2D
    var spot: String? = nil
    var waveHeightMin: String? = nil
    var waveHeightMax: String? = nil
    var periodMin: String? = nil
    var periodMax: String? = nil
    var swellDirection: WeatherTypes.Direction? = nil
    var windDirection: WeatherTypes.Direction? = nil
    
    struct Property {
        static let spot = "spot"
        static let waveHeightMin = "waveHeightMin"
        static let waveHeightMax = "waveHeightMax"
        static let periodMin = "periodMin"
        static let periodMax = "periodMax"
        static let swellDirection = "swellDirection"
        static let windDirection = "windDirection"
    }
    
    init(withDictionary dictionary: [String: AnyObject]) {
        self.spot = dictionary[Property.spot] as? String
        self.waveHeightMin = dictionary[Property.waveHeightMin] as? String
        self.waveHeightMax = dictionary[Property.waveHeightMax] as? String
        self.periodMin = dictionary[Property.periodMin] as? String
        self.periodMax = dictionary[Property.periodMax] as? String
        self.swellDirection = (dictionary[Property.swellDirection] as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
        self.windDirection = (dictionary[Property.windDirection] as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
    }
    
}
