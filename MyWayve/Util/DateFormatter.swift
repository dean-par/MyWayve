//
//  DateFormatter.swift
//  MyWayve
//
//  Created by Dean Parreno on 11/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let yearMonthDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
}
