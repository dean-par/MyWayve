//
//  ForecastManager.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Alamofire
import Foundation

class ForecastManager {
    
    func fetchForecast(completion: @escaping ([HourlyForecast]?) -> Void) {
        Alamofire.request(
            URL(string: "https://api.worldweatheronline.com/premium/v1/marine.ashx?key=367bb50e44bb44c887e231804172809&q=-33.77867, 151.28569&format=json&includelocation=yes&tide=yes&tp=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")!,
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
                    print(forecast?.dailyWeather[2].hourlyForecasts)
                }
                completion(nil)
        }
    }
}
