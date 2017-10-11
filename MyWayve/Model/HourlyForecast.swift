//
//  Forecast.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class HourlyForecast {
    /*
    {
    DewPointC = 16;
    DewPointF = 61;
    FeelsLikeC = 19;
    FeelsLikeF = 67;
    HeatIndexC = 19;
    HeatIndexF = 67;
    WindChillC = 19;
    WindChillF = 67;
    WindGustKmph = 38;
    WindGustMiles = 24;
    cloudcover = 94;
    humidity = 83;
    precipMM = "0.0";
    pressure = 1019;
    "sigHeight_m" = "1.6";
    swellDir = 50;
    swellDir16Point = NE;
    "swellHeight_ft" = "3.9";
    "swellHeight_m" = "1.2";
    "swellPeriod_secs" = "8.1";
    tempC = 19;
    tempF = 67;
    time = 0;
    visibility = 10;
    "waterTemp_C" = 19;
    "waterTemp_F" = 67;
    weatherCode = 122;
    weatherDesc =             (
    {
    value = Overcast;
    }
    );
    weatherIconUrl =             (
    {
    value = "http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0004_black_low_cloud.png";
    }
    );
    winddir16Point = NE;
    winddirDegree = 35;
    windspeedKmph = 34;
    windspeedMiles = 21;
     */
    
    fileprivate struct Property {
        static let windEnergy = "WindGustKmph"
        static let windDirection = "swellDir16Point"
        static let period = "swellPeriod_secs"
        static let swellHeight = "swellHeight_m"
        static let swellDirection = "swellDir"
    }
    
    let windEnergy: Double
    let windDirection: Direction
    let period: Double
    let swellHeight: Double
    let swellDirection: Direction
    
    enum Direction: String {
        case N, NNE, NE, NEE, E, SEE, SE, SSE, S, SSW, SW, SWW, W, NWW, NW, NNW
    }
    
    init?(withDictionary dictionary: [String : AnyObject]) {
        guard let windEnergy = (dictionary[Property.windEnergy] as? String).flatMap(Double.init),
            let windDirection = (dictionary[Property.windDirection] as? String).flatMap(Direction.init(rawValue:)),
            let period = (dictionary[Property.period] as? String).flatMap(Double.init),
            let swellHeight = (dictionary[Property.swellHeight] as? String).flatMap(Double.init),
            let swellDirection = (dictionary[Property.swellDirection] as? String).flatMap(Direction.init(rawValue:))
            else { return nil }
        self.windEnergy = windEnergy
        self.windDirection = windDirection
        self.period = period
        self.swellHeight = swellHeight
        self.swellDirection = swellDirection
    }
}
