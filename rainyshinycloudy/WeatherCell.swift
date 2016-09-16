//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by Matthias Hofmann on 16.09.16.
//  Copyright © 2016 MatthiasHofmann. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    // MARK: Configure Cell
    //Method that configures the custom cells
    
    func configureCell(forecast: Forecast) {
        
        lowTempLabel.text = forecast.lowTemp
        highTempLabel.text = forecast.highTemp
        weatherTypeLabel.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
        
    }


}
