//
//  SecondViewController.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import UIKit

class SaveConditionsViewController: UITableViewController {

    @IBOutlet weak var spotTextField: UITextField!
    @IBOutlet weak var waveHeightMinTextField: UITextField!
    @IBOutlet weak var waveHeightMaxTextField: UITextField!
    @IBOutlet weak var periodMinTextField: UITextField!
    @IBOutlet weak var periodMaxTextField: UITextField!
    @IBOutlet weak var swellDirectionTextField: UITextField!
    @IBOutlet weak var windDirectionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        let conditionsDictionary = [Condition.Property.spot: spotTextField.text,
                         Condition.Property.waveHeightMin: waveHeightMinTextField.text,
                         Condition.Property.waveHeightMax: waveHeightMaxTextField.text,
                         Condition.Property.periodMin: periodMinTextField.text,
                         Condition.Property.periodMax: periodMaxTextField.text,
                         Condition.Property.swellDirection: swellDirectionTextField.text,
                         Condition.Property.windDirection: windDirectionTextField.text]
        let conditions = Condition.init(withDictionary: conditionsDictionary as [String : AnyObject])
        // TODO: To add archiving to Condition in order to save the setting.
        StartupSettings.conditions = [conditions]
    }

}

