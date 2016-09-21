//
//  ViewController.swift
//  macOS Example
//
//  Created by Leo Dion on 9/21/16.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

import Cocoa
import SwiftVer

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  
  public let values = Version.example.values
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

  func numberOfRows(in tableView: NSTableView) -> Int {
    return values.count
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    var image:NSImage?
    var text:String = ""
    var cellIdentifier: String = ""
    
    // 1
    /*
    guard let item = directoryItems?[row] else {
      return nil
    }
    
    // 2
    if tableColumn == tableView.tableColumns[0] {
      image = item.icon
      text = item.name
      cellIdentifier = "NameCellID"
    } else if tableColumn == tableView.tableColumns[1] {
      text = item.date.description
      cellIdentifier = "DateCellID"
    } else if tableColumn == tableView.tableColumns[2] {
      text = item.isFolder ? "--" : sizeFormatter.stringFromByteCount(item.size)
      cellIdentifier = "SizeCellID"
    }
    */
    // 3
  
    if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
      cell.textField?.stringValue = text
      cell.imageView?.image = image ?? nil
      return cell
    }
    return nil
  }
}

