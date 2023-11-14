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
