//
//  ViewController.swift
//  Forecast
//
//  Created by Oleg Marchik on 2/10/17.
//  Copyright © 2017 Oleg Marchik. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempratureLabel: UILabel!
    
    
    @IBOutlet weak var temperature1: UILabel!
    @IBOutlet weak var temperature2: UILabel!
    @IBOutlet weak var temperature3: UILabel!
    @IBOutlet weak var temperature4: UILabel!
    @IBOutlet weak var temperature5: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func loadWeatherAndUpdateUI() {
        guard let latitude = locationManager.location?.coordinate.latitude else { return }
        guard let longitude = locationManager.location?.coordinate.longitude else { return }
        WeatherDownloader.sharedInstance.requestWeather(latitude: latitude, longitude: longitude, comlition: { (weatherData) in
            self.updateUI(weatherData)
        })
    }
    func loadForecastAndUpdateUI() {
            guard let latitude = locationManager.location?.coordinate.latitude else { return }
            guard let longitude = locationManager.location?.coordinate.longitude else { return }
            ForecastDownloader.sharedInstance2.requestForecast(latitude: latitude, longitude: longitude, comlition: { (temp) in
                self.updateUIForecast(temp)
            })

    }
 
    func updateUIForecast(_ temp: [Double]) {
    //temperature1.text = weatherData.
      //  weatherDescriptionLabel.text = weatherData.cityName
        //if let temp = weatherData.temprature {
          //  tempratureLabel.text = "\(temp - 273.15)˚"
        //}
    }


    
    
    func updateUI(_ weatherData: WeatherData) {
        cityLabel.text = weatherData.cityName
        weatherDescriptionLabel.text = weatherData.type
        if let temp = weatherData.temprature {
            tempratureLabel.text = "\(temp - 273.15)˚"
        }
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            loadWeatherAndUpdateUI()
            loadForecastAndUpdateUI()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        loadWeatherAndUpdateUI()
        loadForecastAndUpdateUI()
    }
}
