//
//  Condition.swift
//  MyWayve
//
//  Created by Dean Parreno on 22/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

struct Condition: Codable {
    
    // Chagen to CLLocationCoordinate2D
    let spot: String
    let waveHeightMin: String
    let waveHeightMax: String
    let periodMin: String
    let periodMax: String
    let swellDirection: Direction?
    let windDirection: Direction?
    
    private enum CodingKeys: CodingKey {
        case spot, waveHeightMin, waveHeightMax, periodMin, periodMax, swellDirection, windDirection
    }
    
    init(spot: String, waveHeightMin: String, waveHeightMax: String, periodMin: String, periodMax: String, swellDirection: Direction?, windDirection: Direction?) {
        self.spot = spot
        self.waveHeightMin = waveHeightMin
        self.waveHeightMax = waveHeightMax
        self.periodMin = periodMin
        self.periodMax = periodMax
        self.swellDirection = swellDirection
        self.windDirection = windDirection
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        spot = try container.decode(String.self, forKey: .spot)
        waveHeightMin = try container.decode(String.self, forKey: .waveHeightMin)
        waveHeightMax = try container.decode(String.self, forKey: .waveHeightMax)
        periodMin = try container.decode(String.self, forKey: .periodMin)
        periodMax = try container.decode(String.self, forKey: .periodMax)
        swellDirection = try? container.decode(Direction.self, forKey: .swellDirection)
        windDirection = try? container.decode(Direction.self, forKey: .windDirection)
    }

}
