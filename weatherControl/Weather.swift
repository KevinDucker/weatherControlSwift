//
//  weather.swift
//  weatherControl
//
//  Created by Kevin Ducker Marin on 11/10/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//

import UIKit
import Alamofire

protocol WeatherProtocol: class {
    func successWeatherModel()
    func errorWeatherModel()
}

class Weather: NSObject {
    
    weak var delegate : WeatherProtocol?
    
    var name:String
    var latitude:Double
    var longitude:Double
    var humidity:Int
    var sea_level:Double
    var temp_min:Double
    var temp_max:Double
    var sunrise:Int
    var sunset:Int
    var weatherDescription:String
    var mainWeather:String
    var windDirection:Int
    var windSpeed:Double

    
    override
    init() {
        name = String()
        latitude = 0
        longitude = 0.0
        humidity = 0
        sea_level = 0.0
        temp_min = 0.0
        temp_max = 0.0
        sunrise = 0
        sunset = 0
        weatherDescription = String()
        mainWeather = String()
        windDirection = 0
        windSpeed = 0.0
    }
    
    func getWeather(){
        
        let url = "http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1"
        
        Alamofire.request(url).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
                let JSON = json as! NSDictionary
                print(JSON["ok"] ?? "nada")
                let coords = (response.result.value as? [String : AnyObject])!["coord"]!
                let main = (response.result.value as? [String : AnyObject])!["main"]!
                let weather = JSON["weather"] as! NSArray
                let weatherDic = weather[0] as! NSDictionary
                let sys = (response.result.value as? [String : AnyObject])!["sys"]!
                let wind = (response.result.value as? [String : AnyObject])!["wind"]!

                self.name = (JSON["name"] as? String)!
                self.latitude = coords["lat"]! as! Double
                self.longitude = coords["lon"]! as! Double
                self.humidity = main["humidity"]! as! Int
                self.sea_level = main["sea_level"]! as! Double
                self.temp_min = main["temp_min"]! as! Double
                self.temp_max = main["temp_max"]! as! Double
                self.sunrise = sys["sunrise"]! as! Int
                self.sunset = sys["sunset"]! as! Int
                self.weatherDescription = weatherDic["description"]! as! String
                self.mainWeather = weatherDic["main"]! as! String
                self.windDirection = wind["deg"]! as! Int
                self.windSpeed = wind["speed"]! as! Double
                self.delegate?.successWeatherModel()
            }else{
                self.delegate?.errorWeatherModel()
            }
        }
    }

}

