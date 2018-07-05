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
    
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
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
        // Load default location of Sydney.
        loadForecast(coordinate: CLLocationCoordinate2D(latitude: -33.73176, longitude: 151.30146))
    }
    
    private func loadForecast(coordinate: CLLocationCoordinate2D) {
        tableView.addSubview(activityIndicator)
        activityIndicator.frame = tableView.bounds
        activityIndicator.startAnimating()
        ForecastManager.shared.fetchWeather(coordinate: coordinate, completionHandler: { weatherDetail in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                
                if let hourlyWeather = weatherDetail.weather.first?.hourly.first {
                    strongSelf.spotLabel.text = String(weatherDetail.nearestArea.first!.latitude) + ", " + String(weatherDetail.nearestArea.first!.latitude)
                    strongSelf.swellHeightLabel.text = String(hourlyWeather.swellHeight_m)
                    strongSelf.swellDirectionLabel.text = String(hourlyWeather.swellDir)
                    strongSelf.periodLabel.text = String(hourlyWeather.swellPeriod_secs)
                    strongSelf.windEnergyLabel.text = String(hourlyWeather.windspeedKmph) + " kmph"
                    strongSelf.windDirectionLabel.text = hourlyWeather.winddir16Point
                    strongSelf.tableView.reloadData()
                    strongSelf.activityIndicator.removeFromSuperview()
                }
            }
        }) { error in
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicator.removeFromSuperview()
            }
            print(error)
        }
    }
  
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        loadForecast(coordinate: coordinate)
    }

}

