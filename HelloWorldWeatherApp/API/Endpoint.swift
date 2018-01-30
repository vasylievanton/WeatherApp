//
//  Endpoint.swift
//  HelloWorldWeatherApp
//
//  Created by admin on 29.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponent: URLComponents {
        var component = URLComponents(string: baseURL)
        component?.path = path
        component?.queryItems = queryItems
        
        return component!
    }
    var request: URLRequest {
        return URLRequest(url: urlComponent.url!)
    }
}

enum WeatherEndpoint: Endpoint {
    case fiveDaysForecast(city: String)
    
    var baseURL: String {
        //return "http://api.openweathermap.org"
        return "https://api.wunderground.com"
    }
    var path: String {
        switch self {
        case .fiveDaysForecast(let city):
            //return "/data/2.5/forecast?q=\(city)&mode=json&lang=en&units=metric&appid=825a320e06b97ec7b281f12109173ec3"
            return "/api/00ccf9b3d2e7f761/forecast10day/q/\(city).json"
        }
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
}
