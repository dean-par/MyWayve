//
//  ConditionMetricCell.swift
//  MyWayve
//
//  Created by Dean Parreno on 3/9/20.
//  Copyright © 2020 DeanParreno. All rights reserved.
//

import UIKit

protocol ConditionMetricCellDelegate: AnyObject {
    func save(metric: String, conditionKey: ConditionMetric)
}

class ConditionMetricCell: UITableViewCell, UITextViewDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var metricField: UITextField!
        
    weak var delegate: ConditionMetricCellDelegate?
    var conditionMetric: ConditionMetric?
    
    func bind(metric: ConditionMetric) {
        conditionMetric = metric
        titleLabel.text = metric.title
        metricField.placeholder = metric.promptText
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        delegate?.save(metric: textView.text, conditionKey: conditionMetric!)
    }
}
