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
    
    // Change the font and size of the nav bar text in code. Skipped because I did it in IB
    //    let navBarAttributesDictionary: [String: AnyObject]? = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    //    navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
  }

  // MARK: - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }

  
  // MARK: Fetching Weather
  
  func retrieveWeatherForecast() {
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinates.lat, lon: coordinates.lon) {
      (let currently) in
      
      if let currentWeather = currently {
        
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
        }
        
      }
    }
  }
}
