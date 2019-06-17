//
//  RealCurrentForecast.swift
//  WeatherForecast
//
//  Created by Solji Kim on 15/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

struct RealCurrentForecast: Decodable {
    let weather: CurrentWeather
}

struct CurrentWeather: Decodable {
    let hourly: [CurrentHourly]
}

struct CurrentHourly: Decodable {
    let grid: Grid
    let sky: Sky
    let temperature: Temperature
    let timeRelease: String
    
    struct Grid: Decodable {
        let longitude: String
        let latitude: String
    }
    
    struct Sky: Decodable {
        let code: String
        let name: String
    }
    
    struct Temperature: Decodable {
        let tc: String
        let tmax: String
        let tmin: String
    }
}
