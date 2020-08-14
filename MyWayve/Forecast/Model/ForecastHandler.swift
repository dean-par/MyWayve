//
//  ForecastManager.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Alamofire
import CoreLocation
import Foundation

enum ForecastHandler {
    
    static func fetchForecast(coordinate: CLLocationCoordinate2D, completion: @escaping (WeatherDetail?) -> Void) {
        AF.request(Configuration.forecastURL(for: coordinate)!, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: WeatherData.self) { (response) in
                guard let weather = response.value else {
                    completion(nil)
                    return }
                completion(weather.data)
        }
    }
    
}
