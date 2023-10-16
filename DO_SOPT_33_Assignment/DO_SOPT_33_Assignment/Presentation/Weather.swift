//
//  Weather.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 10/16/23.
//

import Foundation

struct Weather {
    let local: String
    let weather: String
    let currentTemp: Int
    let maxTemp: Int
    let minTemp: Int
    let description: String
    let timeZoneWeather: [TimeZoneWeather]
}

struct TimeZoneWeather {
    let time: String
    let state: WeatherState
    let temp: Int
}
