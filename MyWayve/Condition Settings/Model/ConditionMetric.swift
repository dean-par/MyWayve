//
//  ConditionMetric.swift
//  MyWayve
//
//  Created by Dean Parreno on 3/9/20.
//  Copyright © 2020 DeanParreno. All rights reserved.
//

import Foundation

enum ConditionMetric: String, CaseIterable {
    case location
    case waveHeightMin
    case waveHeightMax
    case periodMin
    case periodMax
    case swellDirection
    case windDirection
    
    var title: String {
        switch self {
        case .location: return "Spot"
        case .waveHeightMin: return "Wave Height Min (in m)"
        case .waveHeightMax: return "Wave Height Max (in m)"
        case .periodMin: return "Period Min (in secs)"
        case .periodMax: return "Period Max (in secs)"
        case .swellDirection: return "Swell Direction"
        case .windDirection: return "Wind Direction"
        }
    }
    
    var promptText: String {
        switch self {
        case .location: return "latitude, longitude (-31, -131)"
        case .waveHeightMin: return "in m"
        case .waveHeightMax: return "in m"
        case .periodMin: return "in secs"
        case .periodMax: return "in secs"
        case .swellDirection: return "N, S, E, W"
        case .windDirection: return "N, S, E, W"
        }
    }
}
