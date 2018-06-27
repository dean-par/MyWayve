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

class ForecastManager: NSObject {
    
    func fetchWeather(coordinate: CLLocationCoordinate2D) {
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
                    print("test:\(weather.data.weather.first?.maxtempC)")
                    
                } catch {
                    print(error)
                }
            }
          
            print(error)
            print(response)
        })
        task.resume()
    }
    
    func fetchForecast(coordinate: CLLocationCoordinate2D, completion: @escaping (MultiDayForecast?) -> Void) {
        fetchWeather(coordinate: coordinate)
        //return MultiDayForecast(with: [ : ])
//        Alamofire.request(
//            Configuration.forecastURL(for: coordinate)!,
//            method: .get,
//            parameters: nil)
//            .validate()
//            .responseJSON { (response) -> Void in
//                let forecast: MultiDayForecast?
//                switch response.result {
//                case .failure(let error):
//                    print(error)
//                    forecast = nil
//                case .success(let data):
//                    guard let json = data as? [String : AnyObject],
//                        let dataDictionary = json["data"] as? [String : AnyObject]
//                        else { return }
//                    forecast = MultiDayForecast(with: dataDictionary)
//                }
//                completion(forecast)
//        }
        
        //let myStructArray = try JSONDecoder().decode([Swifter].self, from: json)

    }
}
