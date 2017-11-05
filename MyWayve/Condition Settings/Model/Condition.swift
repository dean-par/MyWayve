//
//  Condition.swift
//  MyWayve
//
//  Created by Dean Parreno on 22/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class Condition: NSObject, NSCoding {
    
    // Chagen to CLLocationCoordinate2D
    let spot: String
    let waveHeightMin: String
    let waveHeightMax: String
    let periodMin: String
    let periodMax: String
    let swellDirection: WeatherTypes.Direction?
    let windDirection: WeatherTypes.Direction?
    
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
        self.spot = dictionary[Property.spot] as? String ?? ""
        self.waveHeightMin = dictionary[Property.waveHeightMin] as? String ?? ""
        self.waveHeightMax = dictionary[Property.waveHeightMax] as? String ?? ""
        self.periodMin = dictionary[Property.periodMin] as? String ?? ""
        self.periodMax = dictionary[Property.periodMax] as? String ?? ""
        self.swellDirection = (dictionary[Property.swellDirection] as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
        self.windDirection = (dictionary[Property.windDirection] as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
    }
    
    required init?(coder aDecoder: NSCoder) {
        spot = aDecoder.decodeObject(forKey: Property.spot) as? String ?? ""
        waveHeightMin = aDecoder.decodeObject(forKey: Property.waveHeightMin) as? String ?? ""
        waveHeightMax = aDecoder.decodeObject(forKey: Property.waveHeightMax) as? String ?? ""
        periodMin = aDecoder.decodeObject(forKey: Property.periodMin) as? String ?? ""
        periodMax = aDecoder.decodeObject(forKey: Property.periodMax) as? String ?? ""
        swellDirection = (aDecoder.decodeObject(forKey: Property.swellDirection) as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
        windDirection = (aDecoder.decodeObject(forKey: Property.windDirection) as? String).flatMap(WeatherTypes.Direction.init(rawValue:))
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(spot, forKey: Property.spot)
        aCoder.encode(waveHeightMin, forKey: Property.waveHeightMin)
        aCoder.encode(waveHeightMax, forKey: Property.waveHeightMax)
        aCoder.encode(periodMin, forKey: Property.periodMin)
        aCoder.encode(periodMax, forKey: Property.periodMax)
        aCoder.encode(swellDirection, forKey: Property.swellDirection)
        aCoder.encode(windDirection, forKey: Property.windDirection)
    }
    
}
