//
//  WeatherWunderground.swift
//  HelloWorldWeatherApp
//
//  Created by admin on 30.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
class WeatherWundergroung: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let txt_forecast: ForecastWunder
}

struct ForecastWunder: Codable {
    let date: String
    let forecastday: [ForecastWunderDay]
}


struct ForecastWunderDay: Codable {
    let icon_url: URL
    let title: String
    let fcttext_metric: String
}

