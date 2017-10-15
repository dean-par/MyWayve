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

class ForecastManager {
    
    struct Property {
        static let apiKey = "367bb50e44bb44c887e231804172809"
    }
    
    func fetchForecast(completion: @escaping ([HourlyForecast]?) -> Void) {
        Alamofire.request(
            Configuration.forecastURL(for: CLLocationCoordinate2D(latitude: -33.73176, longitude: 151.30146))!,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                switch response.result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    guard let json = data as? [String : AnyObject],
                        let dataDictionary = json["data"] as? [String : AnyObject]
                        else { return }
                    print(dataDictionary)
                    let forecast = MultiDayForecast(with: dataDictionary)
                    print(forecast?.dailyWeather[2].hourlyForecasts.first?.swellDirection)
                }
                completion(nil)
        }
    }
}
