//
//  WeatherDetailService.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/14/23.
//

import Foundation

class WeatherDetailService {
    static let shared = WeatherDetailService()
    private init() {}
    
    func makeDetailWeatherRequest(cityName: String) -> URLRequest {
        let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
        let url = URL(string: baseURL + "forecast?units=metric&q=\(cityName)&appid=" + apiKey)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func GetDetailWeatherData(cityName: String) async throws -> WeatherDetailResponseDTO? {
        do {
            let request = self.makeDetailWeatherRequest(cityName: cityName)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseCheckData(data: data)
        } catch {
            throw error
        }
    }
    
    private func parseCheckData(data: Data) -> WeatherDetailResponseDTO? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(WeatherDetailResponseDTO.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
}
