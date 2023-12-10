//
//  DetailViewModel.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 12/5/23.
//

import UIKit

final class DetailViewModel: NSObject {
    
    var indexNumber: Int = 0

    var minTempArray: [Int] = []
    var maxTempArray: [Int] = []
    var minMinTemp: Int = 0
    var maxMaxTemp: Int = 0
    var hourWeatherCount: Int = 0
    
    var hourDetailWeathersData: [WeatherDetailResponseDTO] = [WeatherDetailResponseDTO(cod: "", message: 0, cnt: 0, list: [List(dt: 0, main: MainClass(temp: 0, feelsLike: 0, tempMin: 0, tempMax: 0, pressure: 0, seaLevel: 0, grndLevel: 0, humidity: 0, tempKf: 0), weather: [DetailWeather(id: 0, main: .clear, description: "", icon: "")], clouds: Clouds(all: 0), wind: Wind(speed: 0, deg: 0, gust: 0), visibility: 0, pop: 0, sys: DetailSys(pod: .d), dtTxt: "", rain: Rain(the3h: 0), snow: Rain(the3h: 0))], city: City(id: 0, name: "", coord: Coord(lon: 0, lat: 0), country: "", population: 0, timezone: 0, sunrise: 0, sunset: 0))]
    
    func loadWeatherDetailData(completion : @escaping() -> Void) {
        Task {
            do {
                let cities = ["seoul", "daegu", "busan", "daejeon", "mokpo"]
                                
                self.hourDetailWeathersData = []
                
                for cityName in cities {
                    do {
                        if let receivedData = try await WeatherDetailService.shared.GetDetailWeatherData(cityName: cityName) {
                            hourDetailWeathersData.append(receivedData)
                        }
                    } catch {
                        print("Failed to get weather data for \(cityName): \(error)")
                    }
                }

                DispatchQueue.main.async {
                    self.hourWeatherCount = 9
                    print("💛💛💛💛💛💛💛")
                    completion()
                }
            }
        }
    }
    
    func caculateMinMax(data: [TenDaysWeather]) {
        data.forEach {
            minTempArray.append($0.minTemp)
            maxTempArray.append($0.maxTemp)
        }
        
        minMinTemp = minTempArray.min() ?? 0
        maxMaxTemp = maxTempArray.max() ?? 0
    }
}
