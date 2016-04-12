//
//  WeeklyTableViewController.swift
//  Stormy
//
//  Created by Nate Bird on 4/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class WeeklyTableViewController: UITableViewController {

  @IBOutlet weak var currentWeatherIcon: UIImageView!
  @IBOutlet weak var currentTemperatureLabel: UILabel!
  @IBOutlet weak var currentPrecipitationLabel: UILabel!
  @IBOutlet weak var currentTemperatureRangeLabel: UILabel!
  
  let coordinates: (lat: Double, lon: Double) = (34.227801,-84.5339087)
  private let forecastAPIKey = Constant.forecastAPIKey
  
  var weeklyWeather: [DailyWeather] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    retrieveWeatherForecast()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configureView() {
    // Set table view's background view property
    tableView.backgroundView = BackgroundView()
    
    // Set custom height for table view row
    tableView.rowHeight = 64
    
    // Change the font and size of the nav bar text in code. Skipped because I did it in IB
    //    let navBarAttributesDictionary: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    //    navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Weekly Forecast"
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weeklyWeather.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("DailyWeatherCell") as! DailyWeatherTableViewCell
    
    let dailyWeather = weeklyWeather[indexPath.row]
    if let maxTemp = dailyWeather.maxTemperature {
      cell.temperatureLabel.text = "\(maxTemp)º"
    }
    cell.weatherIcon.image = dailyWeather.icon
    cell.dayLabel.text = dailyWeather.day
    return cell
  }

  
  // MARK: Fetching Weather
  
  func retrieveWeatherForecast() {
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinates.lat, lon: coordinates.lon) {
      (let forecast) in
      
      if let weatherForecast = forecast,
        let currentWeather = weatherForecast.currentWeather {
        
        dispatch_async(dispatch_get_main_queue()) {
          
          if let temperature = currentWeather.temperature {
            self.currentTemperatureLabel?.text = "\(temperature)º"
          }
          
          if let precipitation = currentWeather.precipProbability {
            self.currentPrecipitationLabel?.text = "Rain: \(precipitation)%"
          }
          
          if let icon = currentWeather.icon {
            self.currentWeatherIcon?.image = icon
          }
          
          self.weeklyWeather = weatherForecast.weeklyWeather
          
          if let highTemp = self.weeklyWeather.first?.maxTemperature,
            let lowTemp = self.weeklyWeather.first?.minTemperature {
              self.currentTemperatureRangeLabel?.text = "↑\(highTemp)º ↓\(lowTemp)º"
          }
          
          self.tableView.reloadData()
        }
      }
    }
  }
}
