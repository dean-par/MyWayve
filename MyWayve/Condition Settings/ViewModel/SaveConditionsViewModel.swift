//
//  SaveConditionsViewModel.swift
//  MyWayve
//
//  Created by Dean Parreno on 3/9/20.
//  Copyright © 2020 DeanParreno. All rights reserved.
//

import Foundation

class SaveConditionsViewModel {
    let conditionMetrics = ConditionMetric.allCases
    
    var toSaveConditions: [ConditionMetric : String] = [:]

    var numberOfRows: Int {
        conditionMetrics.count
    }
    
    func saveCondition(dictionary: [ConditionMetric: String]) {
        let condition = Condition(spot: dictionary[ConditionMetric.location] ?? "",
                                  waveHeightMin: dictionary[ConditionMetric.waveHeightMax] ?? "",
                                  waveHeightMax: dictionary[ConditionMetric.waveHeightMin] ?? "",
                                  periodMin: dictionary[ConditionMetric.periodMin] ?? "",
                                  periodMax: dictionary[ConditionMetric.periodMax] ?? "",
                                  swellDirection: Direction(rawValue: dictionary[ConditionMetric.swellDirection] ?? ""),
                                  windDirection: Direction(rawValue:dictionary[ConditionMetric.windDirection] ?? ""))
        PersistentSettings.conditions = condition
    }
}
