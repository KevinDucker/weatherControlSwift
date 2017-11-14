//
//  weatherTableViewController.swift
//  weatherControl
//
//  Created by Kevin Ducker Marin on 11/9/17.
//  Copyright © 2017 Kevin Ducker Marin. All rights reserved.
//
import Alamofire
import UIKit
import Foundation


var weatherResponse = NSMutableDictionary()
let url = "http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1"
var form_data = [[String: String]]()

class weatherTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(url).responseJSON { response in
            debugPrint(response)

            if let json = response.result.value {
                print("JSON: \(json)")
                let JSON = json as! NSDictionary
                print(JSON["ok"] ?? "nada")
                let coords = (response.result.value as? [String : String])!["coord"]!
                let main = (response.result.value as? [String : AnyObject])!["main"]!
                let name = (response.result.value as? [String : AnyObject])!["name"]!
                let weather = (response.result.value as? [String : AnyObject])!["weather"]!
                let sys = (response.result.value as? [String : AnyObject])!["sys"]!
                let wind = (response.result.value as? [String : AnyObject])!["wind"]!
                
                print(coords)
                print(main)
                print(name)
                print(weather)
                print(sys)
                print(wind)
                
//                let Name: [String: String] = [
//                    "Titulo": JSON["name"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                form_data.append(Name)
//                let coordsDic: [String: String] = [
//                    "Titulo": "Ubicacion",
//                    "Valor": "Latitude: \(String(describing: coords["lat"]!))",
//                    "Valor1": "Longitude: \(String(describing: coords["lon"]!))",
//                    "Tipo": "1",
//                    "Celda": "1"
//                ]
//                form_data.append(coordsDic)
//                let dayWeather: [String: String] = [
//                    "Titulo": "Daily Weather",
//                    "Valor": "Weather: \(String(describing: weather[0]["main"]!))",
//                    "Valor1": "Description: \(String(describing: weather[0]["description"]!))",
//                    "Tipo": "1",
//                    "Celda": "1"
//                ]
//                form_data.append(dayWeather)
//                let Temp: [String: String] = [
//                    "Titulo": "Temperature",
//                    "Valor": main["temp"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let pressure: [String: String] = [
//                    "Titulo": "Pressure",
//                    "Valor": main["pressure"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let humidity: [String: String] = [
//                    "Titulo": "Humidity",
//                    "Valor": main["humidity"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let max: [String: String] = [
//                    "Titulo": "Max Temperature",
//                    "Valor": main["temp_max"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let min: [String: String] = [
//                    "Titulo": "Min temperature",
//                    "Valor": main["temp_min"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let sea: [String: String] = [
//                    "Titulo": "Sea level",
//                    "Valor": main["sea_level"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let windSpeed: [String: String] = [
//                    "Titulo": "Wind",
//                    "Valor": wind["speed"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let windDirection: [String: String] = [
//                    "Titulo": "Wind direction",
//                    "Valor": wind["deg"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let sunrise: [String: String] = [
//                    "Titulo": "Wind direction",
//                    "Valor": sys["sunrise"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                let sunset: [String: String] = [
//                    "Titulo": "Wind direction",
//                    "Valor": sys["sunset"]! as! String,
//                    "Tipo": "0",
//                    "Celda": ""
//                ]
//                form_data.append(Temp)
//                form_data.append(pressure)
//                form_data.append(humidity)
//                form_data.append(max)
//                form_data.append(min)
//                form_data.append(sea)
//                form_data.append(windSpeed)
//                form_data.append(windDirection)
//                form_data.append(sunrise)
//                form_data.append(sunset)
//
//                print(form_data)
                
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
