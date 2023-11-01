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
    let indexNumber: Int
}

struct TimeZoneWeather {
    let time: String
    let state: WeatherState
    let temp: Int
}


let weatherDummy: [Weather] =
[Weather(local: "강서구",
         weather: "흐림",
         currentTemp: 21, maxTemp: 29, minTemp: 15,
         description: "8:00~9:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
         timeZoneWeather: [TimeZoneWeather(time: "Now", state: .cloudyNight, temp: 21),
                           TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                           TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                           TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                           TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                           TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                           TimeZoneWeather(time: "15시", state: .rain, temp: 22),
                           TimeZoneWeather(time: "16시", state: .rain, temp: 21),
                           TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                           TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 0),
 Weather(local: "양천구",
         weather: "비",
         currentTemp: 19, maxTemp: 25, minTemp: 18,
         description: "오전부터 계속해서 비가 내리는 상태가 예상되며, 돌풍의 풍속은 최대 4m/s 입니다.",
         timeZoneWeather: [TimeZoneWeather(time: "Now", state: .heavyRain, temp: 19),
                           TimeZoneWeather(time: "10시", state: .rain, temp: 18),
                           TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                           TimeZoneWeather(time: "12시", state: .heavyRain, temp: 22),
                           TimeZoneWeather(time: "13시", state: .rain, temp: 23),
                           TimeZoneWeather(time: "14시", state: .rain, temp: 25),
                           TimeZoneWeather(time: "15시", state: .rain, temp: 25),
                           TimeZoneWeather(time: "16시", state: .rain, temp: 24),
                           TimeZoneWeather(time: "17시", state: .rainyDay, temp: 24),
                           TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 22)], indexNumber: 1),
 Weather(local: "마포구",
         weather: "폭우",
         currentTemp: 13, maxTemp: 29, minTemp: 13,
         description: "오후 12시까지 계속해서 폭우가 내릴 예정이며, 최저 기온은 13도입니다.",
         timeZoneWeather: [TimeZoneWeather(time: "Now", state: .heavyRain, temp: 13),
                           TimeZoneWeather(time: "10시", state: .thunder, temp: 14),
                           TimeZoneWeather(time: "11시", state: .heavyRain, temp: 14),
                           TimeZoneWeather(time: "12시", state: .rain, temp: 18),
                           TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                           TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                           TimeZoneWeather(time: "15시", state: .rainyDay, temp: 20),
                           TimeZoneWeather(time: "16시", state: .rainyDay, temp: 19),
                           TimeZoneWeather(time: "17시", state: .cloudyNight, temp: 19),
                           TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 2),
 Weather(local: "영등포구",
         weather: "비",
         currentTemp: 21, maxTemp: 22, minTemp: 15,
         description: "하루종일 비가 내릴 예정이며, 돌풍의 풍속은 최대 4m/s 입니다.",
         timeZoneWeather: [TimeZoneWeather(time: "Now", state: .rain, temp: 21),
                           TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                           TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                           TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                           TimeZoneWeather(time: "13시", state: .rain, temp: 19),
                           TimeZoneWeather(time: "14시", state: .rain, temp: 20),
                           TimeZoneWeather(time: "15시", state: .rain, temp: 22),
                           TimeZoneWeather(time: "16시", state: .rain, temp: 21),
                           TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                           TimeZoneWeather(time: "18시", state: .rainyDay, temp: 19)], indexNumber: 3),
 Weather(local: "구로구",
         weather: "흐림",
         currentTemp: 21, maxTemp: 20, minTemp: 15,
         description: "8:00~9:00에 강우 상태가, 18:00에 한때 흐린 상태가 예상됩니다.",
         timeZoneWeather: [TimeZoneWeather(time: "Now", state: .cloudyNight, temp: 21),
                           TimeZoneWeather(time: "10시", state: .rain, temp: 21),
                           TimeZoneWeather(time: "11시", state: .heavyRain, temp: 19),
                           TimeZoneWeather(time: "12시", state: .thunder, temp: 19),
                           TimeZoneWeather(time: "13시", state: .rainyDay, temp: 19),
                           TimeZoneWeather(time: "14시", state: .rainyDay, temp: 20),
                           TimeZoneWeather(time: "15시", state: .rain, temp: 20),
                           TimeZoneWeather(time: "16시", state: .rain, temp: 20),
                           TimeZoneWeather(time: "17시", state: .rainyDay, temp: 21),
                           TimeZoneWeather(time: "18시", state: .cloudyNight, temp: 19)], indexNumber: 4)]
