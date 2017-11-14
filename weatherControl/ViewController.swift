//
//  ViewController.swift
//  weatherControl
//
//  Created by Kevin Ducker Marin on 11/9/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

import UIKit
import UserNotifications
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_description: UILabel!
    @IBOutlet weak var lb_latitude: UILabel!
    @IBOutlet weak var lb_longitude: UILabel!
    @IBOutlet weak var lb_humidity: UILabel!
    @IBOutlet weak var lb_seaLvl: UILabel!
    @IBOutlet weak var lb_minTemp: UILabel!
    @IBOutlet weak var lb_maxTemp: UILabel!
    @IBOutlet weak var lb_sunrise: UILabel!
    @IBOutlet weak var lb_sunset: UILabel!
    @IBOutlet weak var lb_windDir: UILabel!
    @IBOutlet weak var lb_windSpeed: UILabel!
    
    var locationManager: CLLocationManager!
    
    var weatherData = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        weatherData.delegate = self
        weatherData.getWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }else if status == .authorizedWhenInUse{
            
        }else{
            let alert = UIAlertController(title: "Location settings", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: WeatherProtocol {
    
    func successWeatherModel() {
        
        lb_title.text = weatherData.name
        lb_description.text = "Weather: \(weatherData.mainWeather) Description: \(weatherData.weatherDescription)"

        lb_humidity.text = "Humidity: \(weatherData.humidity)"
        lb_seaLvl.text = "Sea level: \(weatherData.sea_level)"
        lb_minTemp.text = "Min temp: \(weatherData.temp_min)"
        lb_maxTemp.text = "Max temp: \(weatherData.temp_max)"
        lb_sunrise.text = "Sunrise: \(weatherData.sunrise)"
        lb_sunset.text = "Sunset: \(weatherData.sunset)"
        lb_windDir.text = "Wind direction: \(weatherData.windDirection)"
        lb_windSpeed.text = "Wind speed: \(weatherData.windSpeed)"
        
        if let currentLocation = locationManager.location {
            lb_latitude.text = "Latitude: \(currentLocation.coordinate.latitude)"
            lb_longitude.text = "Longitude: \(currentLocation.coordinate.longitude)"
        }else{
            print("Without Location")
            let alert = UIAlertController(title: "Error at getting location", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func errorWeatherModel() {
      print("Error en la consulta")
        let alert = UIAlertController(title: "Error", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

