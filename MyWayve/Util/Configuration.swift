//
//  Configuration.swift
//  MyWayve
//
//  Created by Dean Parreno on 15/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import CoreLocation
import Foundation

class Configuration {
    
    class func forecastURL(for coordinate: CLLocationCoordinate2D) -> URL? {
        // https://api.worldweatheronline.com/premium/v1/marine.ashx?key=XXXXX&q=-33.77867, 151.28569&format=json&includelocation=yes&tide=yes&tp=1
        let urlString = "https://api.worldweatheronline.com/premium/v1/marine.ashx"
        guard var urlComponents = URLComponents(string: urlString) else { return nil }
        urlComponents.queryItems = [URLQueryItem(name: "key", value: "76b97ec3642b4d9e8a641914181901"),
                                    URLQueryItem(name: "q", value: "\(coordinate.latitude), \(coordinate.longitude)"),
                                    URLQueryItem(name: "format", value: "json"),
                                    URLQueryItem(name: "tide", value: "yes"),
                                    URLQueryItem(name: "includelocation", value: "yes"),
                                    URLQueryItem(name: "tp", value: "1")]
        return urlComponents.url
    }
    
}
