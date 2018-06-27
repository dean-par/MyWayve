//
//  FirstViewController.swift
//  MyWayve
//
//  Created by Dean Parreno on 5/10/17.
//  Copyright © 2017 DeanParreno. All rights reserved.
//

import UIKit
import GoogleMaps

class SpotViewController: UITableViewController, GMSMapViewDelegate {

    @IBOutlet weak var spotLabel: UILabel!
    @IBOutlet weak var swellHeightLabel: UILabel!
    @IBOutlet weak var swellDirectionLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var windEnergyLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    
    var currentHour: Int {
        let dateFormatter = DateFormatter()
        let hourOfDay = Date()
        dateFormatter.dateFormat = "HH"
        let currentHour = (Int(dateFormatter.string(from: hourOfDay)))!
        return currentHour
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        mapView.delegate = self
        mapView.animate(to: camera)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadForecast(coordinate: CLLocationCoordinate2D(latitude: -33.73176, longitude: 151.30146))


    }
    
    private func loadForecast(coordinate: CLLocationCoordinate2D) {
        ForecastManager().fetchForecast(coordinate: coordinate) { forecast in
            let weatherNow = forecast.first?.hourly.first
            //self.spotLabel.text = String(describing: forecast.coordinate.latitude) + ", " + String(describing: forecast.coordinate.longitude)
            self.swellHeightLabel.text = String(describing: weatherNow?.swellHeight_m)
            self.swellDirectionLabel.text = String(describing: weatherNow?.swellDir)
            self.periodLabel.text = String(describing: weatherNow?.swellPeriod_secs)
            self.windEnergyLabel.text = String(describing: weatherNow?.windspeedKmph) + " kmph"
            self.windDirectionLabel.text = String(describing: weatherNow?.winddir16Point)
            self.tableView.reloadData()
        }
    }
  
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        loadForecast(coordinate: coordinate)
    }

    

}

