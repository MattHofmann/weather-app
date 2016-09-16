//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Matthias Hofmann on 16.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import UIKit
import Alamofire

//  Class to download the current weather
class CurrentWeather {

    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String! {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    // MARK: Download weather data with Alamofire
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamamofire download
        //let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)
        //Alamofire.request(currentWeatherURL).responseJSON { response in
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                // cityname
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                // weatherType
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                // current temp
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        // Convert to Fahrenheit
                        //let kelvinToFahrenheitPreDivision = (currentTemperature * (9/5) - 459.67)
                        //let kelvinToFahrenheit = Double(round(10 * kelvinToFahrenheitPreDivision/10))
                        
                        // Convert to Celsius
                        let kelvinToCelsiusPreDivision = currentTemperature - 273.15
                        let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
                        self._currentTemp = kelvinToCelsius
                        print(self._currentTemp)
                    }
                }
            }
            completed()

        }

    }
    
}
