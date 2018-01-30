//
//  WeatherTableViewController.swift
//  HelloWorldWeatherApp
//
//  Created by admin on 29.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class WeatherTableViewController: UITableViewController {
    
    var cellViewModels = [WeatherCellVIewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weatherAPI = WeatherAPIClient()
        let weatherEndpoint = WeatherEndpoint.fiveDaysForecast(city: "Kyiv")
        SVProgressHUD.showInfo(withStatus: "Fetching Data")
        weatherAPI.weather(with: weatherEndpoint) { (either) in
            SVProgressHUD.dismiss()
            switch either {
            case .value(let forecastText):
                print(forecastText)
                self.cellViewModels = forecastText.forecastday.map {
                    WeatherCellVIewModel(icon_url: $0.icon_url, title: $0.title, fcttext_metric: $0.fcttext_metric)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .error(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
        let cellVIewModel = cellViewModels[indexPath.row]
        
        cell.textLabel?.text = cellVIewModel.title
        cell.detailTextLabel?.text = cellVIewModel.fcttext_metric
        cell.imageView?.kf.setImage(with: cellVIewModel.icon_url)
        return cell
    }
}

