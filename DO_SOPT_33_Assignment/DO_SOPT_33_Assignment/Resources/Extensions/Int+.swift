//
//  Int+.swift
//  DO_SOPT_33_Assignment
//
//  Created by 정채은 on 11/14/23.
//

import Foundation

func convertTime(timezone: Int) -> String {
    let timeZone = TimeZone(secondsFromGMT: timezone)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = timeZone
    let currentDate = Date()
    let formattedTime = dateFormatter.string(from: currentDate)
    return formattedTime
}

func convert3HTime(timezone: Int) -> [String] {
    var timeArray: [String] = []
    
    // Get the current date and time in the specified timezone
    let timeZone = TimeZone(secondsFromGMT: timezone)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH"
    dateFormatter.timeZone = timeZone
    
    // Calculate the current hour and convert it to an integer
    let currentHour = Int(dateFormatter.string(from: Date())) ?? 0
    
    // Generate the time array by adding 3 hours iteratively
    for i in 0..<9 {
        let nextHour = (currentHour + i * 3) % 24
        let formattedHour = String(format: "%02d시", nextHour)
        timeArray.append(formattedHour)
    }
    
    return timeArray
}
