//
//  ViewController.swift
//  tvOS Example
//
//  Created by Leo Dion on 9/21/16.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

import UIKit
import SwiftVer

class ViewController: UITableViewController {
  
  public let values = Version.example.values
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return values.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    
    let value = values[indexPath.row]
    cell.textLabel?.text = value.label
    cell.detailTextLabel?.text = value.value ?? "Not Set"
    cell.detailTextLabel?.alpha = value.value == nil ? 0.5 : 1.0
    return cell
  }
}

