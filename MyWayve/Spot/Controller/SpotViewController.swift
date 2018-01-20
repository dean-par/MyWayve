//
//  FirstViewController.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import UIKit

class SpotViewController: UITableViewController {

    @IBOutlet weak var spotLabel: UILabel!
    @IBOutlet weak var swellHeightLabel: UILabel!
    @IBOutlet weak var swellDirectionLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var windEnergyLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ForecastManager().fetchForecast { forecast in
            guard let forecast = forecast,
                let weatherNow = forecast.dailyWeather.first?.hourlyForecasts.first else { return }
            self.spotLabel.text = String(describing: forecast.coordinate.latitude) + ", " + String(describing: forecast.coordinate.longitude)
            self.swellHeightLabel.text = String(describing: weatherNow.swellHeight)
            self.swellDirectionLabel.text = String(describing: weatherNow.swellDirection)
            self.periodLabel.text = String(describing: weatherNow.period)
            self.windEnergyLabel.text = String(describing: weatherNow.windEnergy) + " kmph"
            self.windDirectionLabel.text = String(describing: weatherNow.windDirection)
        }
    }

}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
