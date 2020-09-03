//
//  SecondViewController.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import UIKit

class SaveConditionsViewController: UITableViewController {
    
    var viewModel = SaveConditionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: ConditionMetricCell.self), bundle: nil), forCellReuseIdentifier: "condition")
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "condition", for: indexPath)
        (cell as? ConditionMetricCell)?.bind(metric: viewModel.conditionMetrics[indexPath.row])
        (cell as? ConditionMetricCell)?.delegate = self
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
//        let conditionsDictionary = [Condition.Property.spot: spotTextField.text,
//                         Condition.Property.waveHeightMin: waveHeightMinTextField.text,
//                         Condition.Property.waveHeightMax: waveHeightMaxTextField.text,
//                         Condition.Property.periodMin: periodMinTextField.text,
//                         Condition.Property.periodMax: periodMaxTextField.text,
//                         Condition.Property.swellDirection: swellDirectionTextField.text,
//                         Condition.Property.windDirection: windDirectionTextField.text]
//        let conditions = Condition.init(withDictionary: conditionsDictionary as [String : AnyObject])
//        // TODO: To add archiving to Condition in order to save the setting.
//        StartupSettings.conditions = [conditions]
    }

}

extension SaveConditionsViewController: ConditionMetricCellDelegate {
    func save(metric: String, conditionKey: ConditionMetric) {
        viewModel.toSaveConditions[conditionKey] = metric
    }
    
}

