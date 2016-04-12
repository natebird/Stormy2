//
//  Forecast.swift
//  Stormy
//
//  Created by Nate Bird on 4/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

struct Forecast {
  var currentWeather: CurrentWeather?
  var weeklyWeather: [DailyWeather] = []
  
  init(weatherDictionary: [String: AnyObject]?) {
    if let currentWeatherDictionary = weatherDictionary?["currently"] as? [String: AnyObject] {
      currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
    }
    if let weeklyWeatherArray = weatherDictionary?["daily"]?["data"] as? [[String: AnyObject]] {
      for dailyWeather in weeklyWeatherArray {
        let daily = DailyWeather(dailyWeatherDict: dailyWeather)
        weeklyWeather.append(daily)
      }
    }

  }
}