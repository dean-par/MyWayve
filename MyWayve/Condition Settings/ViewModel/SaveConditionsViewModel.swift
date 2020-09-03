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
}
