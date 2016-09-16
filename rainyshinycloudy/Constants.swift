//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by Matthias Hofmann on 16.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/"
let CURRENT_URLPART = "weather?"
let FORECAST_URLPART = "forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let CNT = "&cnt=10"
let APP_ID = "&appid="
let API_KEY = "INSERT_API_KEY" // Your Own API Key from https://openweathermap.org/
    
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(CURRENT_URLPART)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(CNT)\(APP_ID)\(API_KEY)"

let FORECAST_URL = "\(BASE_URL)\(FORECAST_URLPART)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(CNT)\(APP_ID)\(API_KEY)"
