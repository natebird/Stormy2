//
//  ViewController.swift
//  Stormy
//
//  Created by Nate Bird on 4/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class DailyWeatherViewController: UIViewController {

  @IBOutlet weak var currentTemperatureLabel: UILabel!
  @IBOutlet weak var currentHumidityLabel: UILabel!
  @IBOutlet weak var currentPrecipitationLabel: UILabel!
  @IBOutlet weak var currentWeatherIcon: UIImageView!
  @IBOutlet weak var currentWeatherSummary: UILabel!
  
  var dailyWeatherViewController: DailyWeatherViewController? = nil
  var dailyWeather = DailyWeather?()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func configureView() {    
    if let temperature = dailyWeather!.maxTemperature {
      currentTemperatureLabel?.text = "\(temperature)º"
    }
    
    if let humidity = dailyWeather!.humidity {
      self.currentHumidityLabel?.text = "\(humidity)%"
    }
    
    if let precipitation = dailyWeather!.precipChance {
      self.currentPrecipitationLabel?.text = "\(precipitation)%"
    }
    
    if let icon = dailyWeather!.icon {
      self.currentWeatherIcon?.image = icon
    }
    
    if let summary = dailyWeather!.summary {
      self.currentWeatherSummary?.text = summary
    }

  }


}

