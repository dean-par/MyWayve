//
//  ForecastManager.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

//import Alamofire
import CoreLocation
import Foundation

class ForecastManager {
    
    func fetchWeather(coordinate: CLLocationCoordinate2D, completionHandler: @escaping (WeatherDetail) -> Void, errorHandler: @escaping (Error) -> Void) {
        // Set up the URL request
        let urlRequest = NSURLRequest(url: Configuration.forecastURL(for: coordinate)!)
        // set up the session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        // make the request
        let task = session.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) in
            // do stuff with response, data & error here
            if data != nil {
                do {
                    let weather = try JSONDecoder().decode(WeatherData.self, from: data!)
                    completionHandler(weather.data)
                } catch {
                    print(error)
                }
            } else {
                errorHandler(error!)
            }
        })
        task.resume()
    }
   
}
