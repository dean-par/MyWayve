//
//  DailyForecast.swift
//  MyWayve
//
//  Created by Dean Parreno on 10/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class DailyForecast {
    /*
    "date": "2017-10-10",
    "astronomy": [
    {
    "sunrise": "06:20 AM",
    "sunset": "07:04 PM",
    "moonrise": "11:54 PM",
    "moonset": "09:38 AM"
    }
    ],
    "maxtempC": "19",
    "maxtempF": "66",
    "mintempC": "18",
    "mintempF": "64",
    "tides": [
    */
    
    let date: Date
    let astronomy: [AnyObject]
    let maxTemp: Double
    let minTemp: Double
    let tides: [AnyObject]
    let hourlyForecasts: [HourlyForecast]
    
    fileprivate struct Property {
        static let date = "date"
        static let astronomy = "astronomy"
        static let maxTemp = "maxtempC"
        static let minTemp = "maxtempC"
        static let tides = "tides"
        static let hourly = "hourly"
    }
    
    init?(withDictionary dictionary: [String : AnyObject]) {
        guard let maxTemp = (dictionary[Property.maxTemp] as? String).flatMap(Double.init),
            let minTemp = (dictionary[Property.minTemp] as? String).flatMap(Double.init),
            let astronomy = dictionary[Property.astronomy] as? [AnyObject],
            let tides = dictionary[Property.tides] as? [AnyObject],
            let date = (dictionary[Property.date] as? String).flatMap(DateFormatter.yearMonthDateFormatter.date(from:)),
            let hourlyForecasts = (dictionary[Property.hourly] as? [AnyObject])
            else { return nil }
        self.date = date
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.astronomy = astronomy
        self.tides = tides
        self.hourlyForecasts = hourlyForecasts.flatMap { HourlyForecast(withDictionary: $0 as? [String: AnyObject] ?? [ : ])}
    }
}
