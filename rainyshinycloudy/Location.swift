//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Matthias Hofmann on 16.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}

    var latitude: Double!
    var longitude: Double!
    
}
