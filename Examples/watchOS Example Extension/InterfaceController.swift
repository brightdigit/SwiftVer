//
//  InterfaceController.swift
//  watchOS Example Extension
//
//  Created by Leo Dion on 9/21/16.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

import WatchKit
import Foundation
import SwiftVer

class InterfaceController: WKInterfaceController {
  
  public let values = Version.example.values
  @IBOutlet var table: WKInterfaceTable!
  
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    // Configure interface objects here.
    self.table.setNumberOfRows(self.values.count, withRowType: "row")
    
    for (index, pair) in self.values.enumerated() {
     
      let row = self.table.rowController(at: index) as! RowController
      row.titleLabel.setText(pair.label)
      row.valueLabel.setText(pair.value ?? "Not Set")
      row.valueLabel.setAlpha(pair.value == nil ? 0.5 : 1.0)
    }
  }
  
  override func willActivate() {
    // This method is called when watch view controller is about to be visible to user
    super.willActivate()
  }
  
  override func didDeactivate() {
    // This method is called when watch view controller is no longer visible
    super.didDeactivate()
  }
  
}
