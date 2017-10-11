//
//  MultiDayForecast.swift
//  MyWayve
//
//  Created by Dean Parreno on 9/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Alamofire
import CoreLocation
import Foundation

class MultiDayForecast {
    
    let coordinate: CLLocationCoordinate2D
    let dailyWeather: [DailyForecast]
    
    fileprivate struct Property {
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let nearestArea = "nearest_area"
        static let weather = "weather"
    }
    
    
    init?(with dictionary: [String : AnyObject]) {
        guard let nearestAreaDictionary = (dictionary[Property.nearestArea] as? [AnyObject])?.first as? [String : AnyObject],
            let latitude = (nearestAreaDictionary[Property.latitude] as? String).flatMap(Double.init),
            let longitude = (nearestAreaDictionary[Property.longitude] as? String).flatMap(Double.init),
            let forecasts = dictionary[Property.weather] as? [AnyObject]
            else { return nil }
        dailyWeather = forecasts.flatMap { DailyForecast(withDictionary: ($0 as? [String : AnyObject]) ?? [:] )}
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        print(dailyWeather.first?.date)
    }
    
}
