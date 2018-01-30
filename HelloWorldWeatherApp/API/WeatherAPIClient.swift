//
//  WetherAPIClient.swift
//  HelloWorldWeatherApp
//
//  Created by admin on 29.01.2018.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

class WeatherAPIClient: APIClient {
    var session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(with endpoint: WeatherEndpoint, completion: @escaping (Either<ForecastWunder, APIError>) -> Void) {
        let request = endpoint.request
        self.fetch(with: request) { (either: Either<WeatherWundergroung, APIError>) in
            switch either {
            case .value(let weather):
                let weather = weather.forecast.txt_forecast
                completion(.value(weather))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
