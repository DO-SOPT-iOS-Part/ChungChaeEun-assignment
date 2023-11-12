//
//  TenDaysWeather.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/2/23.
//

import Foundation

struct TenDaysWeather {
    let date: String
    let weather: WeatherState
    let humidity: Int
    let minTemp: Int
    let maxTemp: Int
}

let tenDaysWeatherDummy: [TenDaysWeather] =
[TenDaysWeather(date: "오늘", weather: .sun, humidity: 0, minTemp: 15, maxTemp: 23),
 TenDaysWeather(date: "화", weather: .rain, humidity: 60, minTemp: 18, maxTemp: 27),
 TenDaysWeather(date: "수", weather: .rain, humidity: 60, minTemp: 20, maxTemp: 25),
 TenDaysWeather(date: "목", weather: .rain, humidity: 70, minTemp: 19, maxTemp: 23),
 TenDaysWeather(date: "금", weather: .rainyDay, humidity: 50, minTemp: 17, maxTemp: 23),
 TenDaysWeather(date: "토", weather: .cloudyDay, humidity: 0, minTemp: 19, maxTemp: 26),
 TenDaysWeather(date: "일", weather: .sun, humidity: 0, minTemp: 18, maxTemp: 25),
 TenDaysWeather(date: "월", weather: .heavyRain, humidity: 50, minTemp: 16, maxTemp: 20),
 TenDaysWeather(date: "화", weather: .heavyRain, humidity: 50, minTemp: 16, maxTemp: 22),
 TenDaysWeather(date: "수", weather: .sun, humidity: 0, minTemp: 15, maxTemp: 21)]
