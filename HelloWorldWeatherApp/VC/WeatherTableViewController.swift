//
//  WeatherTableViewController.swift
//  HelloWorldWeatherApp
//
//  Created by admin on 29.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherAPI = WeatherAPIClient()
        let weatherEndpoint = WeatherEndpoint.fiveDaysForecast(city: "Kyiv")
        weatherAPI.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let forecastText):
                print(forecastText)
            case .error(let error):
                print(error)
                print("nononon")
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        return cell
    }
}
