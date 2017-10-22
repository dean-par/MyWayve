//
//  DirectionPickerViewController.swift
//  MyWayve
//
//  Created by Dean Parreno on 22/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import UIKit

class DirectionPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return WeatherTypes.Direction.allValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return WeatherTypes.Direction.allValues[row]
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
    }

}
