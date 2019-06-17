//
//  WeatherData.swift
//  WeatherForecast
//
//  Created by Solji Kim on 11/06/2019.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

let jsonWeatherData = """
{
    "weather": {
        "hourly": [
        {
        "grid": {
        "longitude": "127.0977600000",
        "latitude": "37.1177600000",
        "county": "오산시",
        "village": "청호동",
        "city": "경기"
        },
        "sky": {
        "code": "SKY_O01",
        "name": "맑음"
        },
        "temperature": {
        "tc": "19.20",
        "tmax": "24.00",
        "tmin": "13.00"
        },
        "timeRelease": "2017-05-25 18:00:00"
        }
        ]
    },
    "common": {
        "alertYn": "Y",
        "stormYn": "N"
    },
    "result": {
        "code": 9200,
        "requestUrl": "/weather/current/hourly?version=2&lat=37.123&lon=127.123",
        "message": "성공"
    }
}
""".data(using: .utf8)!


struct Response: Decodable {
    let weather: Weather
}

struct Weather: Decodable {
    let hourly: [Hourly]
}

struct Hourly: Decodable {
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



