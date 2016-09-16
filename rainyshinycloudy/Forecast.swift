//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Matthias Hofmann on 16.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import UIKit
import Alamofire

// weather forecast data model
class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String,AnyObject>) {
        // temp dict
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            // min temp
            if let min = temp["min"] as? Double {
                // Convert to Celsius
                let kelvinToCelsiusPreDivision = min - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                self._lowTemp = "\(kelvinToCelsius)°"
            }
            // max temp
            if let max = temp["max"] as? Double {
                // Convert to Celsius
                let kelvinToCelsiusPreDivision = max - 273.15
                let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                self._highTemp = "\(kelvinToCelsius)°"
            }
        }
        // weather
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            // main
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        // date
        if let date = weatherDict["dt"] as? Double {
            // format date to get the day of the week
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}

// MARK: Extension Class Date
//       Extension of class Date, to get the day of the week

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}



