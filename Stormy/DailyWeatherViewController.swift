//
//  ViewController.swift
//  Stormy
//
//  Created by Nate Bird on 4/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class DailyWeatherViewController: UIViewController {

  @IBOutlet weak var weatherIcon: UIImageView?
  @IBOutlet weak var weatherSummary: UILabel?
  @IBOutlet weak var sunriseTimeLabel: UILabel?
  @IBOutlet weak var sunsetTimeLabel: UILabel?
  @IBOutlet weak var lowTemperatureLabel: UILabel?
  @IBOutlet weak var highTemperatureLabel: UILabel?
  @IBOutlet weak var precipitationLabel: UILabel?
  @IBOutlet weak var humidityLabel: UILabel?
  
  var dailyWeather = DailyWeather?() {
    didSet {
      configureView()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // This needs to be called because when the dailyWeather var 
    // is set above they are all nil values.
    configureView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func configureView() {
    if let weather = dailyWeather {
      self.title = weather.day
      weatherIcon?.image = weather.icon
      weatherSummary?.text = weather.summary
      sunriseTimeLabel?.text = weather.sunriseTime
      sunsetTimeLabel?.text = weather.sunsetTime
      
      if let lowTemp = weather.minTemperature,
         let highTemp = weather.maxTemperature,
         let rain = weather.precipChance,
         let humidity = weather.humidity {
            lowTemperatureLabel?.text = "\(lowTemp)º"
            highTemperatureLabel?.text = "\(highTemp)º"
            precipitationLabel?.text = "\(rain)%"
            humidityLabel?.text = "\(humidity)%"
      }
    }
  }
}

