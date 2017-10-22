//
//  Tide.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

class Tide {
    
    //"tideTime": "2:02 AM",
    //"tideHeight_mt": "0.11",
    //"tideDateTime": "2017-10-05 02:02",
    //"tide_type": "LOW"
    
    fileprivate struct Property {
        static let dateTime = "tideDateTime"
        static let height = "tideHeight_mt"
        static let type = "tide_type"
    }
    
    let dateTime: Date
    let height: Double
    let type: TideType
    
    enum TideType: String {
        case low = "LOW"
        case high = "HIGH"
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let dateTime = (dictionary[Property.dateTime] as? String).flatMap({ ISO8601DateFormatter().date(from: $0) }),
            let height = dictionary[Property.height] as? Double,
            let type = (dictionary[Property.type] as? String).flatMap( { TideType(rawValue: $0) })
            else { return nil }
        self.dateTime = dateTime
        self.height = height
        self.type = type
    }
}
