//
//  WeeklyTableViewController.swift
//  Stormy
//
//  Created by Nate Bird on 4/7/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class WeeklyTableViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set table view's background view property
    tableView.backgroundView = BackgroundView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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

}
