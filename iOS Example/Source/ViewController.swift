//
//  ViewController.swift
//  iOS Example
//
//  Created by Leo G Dion on September 20, 2016.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

import UIKit
import SwiftVer

class ViewController: UITableViewController {
  public let version = Version(bundle: Bundle.main, versionControl: VersionControlInfo(TYPE: VCS_TYPE, BASENAME: VCS_BASENAME, UUID: VCS_UUID, NUM: VCS_NUM, DATE: VCS_DATE, BRANCH: VCS_BRANCH, TAG: VCS_TAG, TICK: VCS_TICK, EXTRA: VCS_EXTRA, FULL_HASH: VCS_FULL_HASH, SHORT_HASH: VCS_SHORT_HASH, WC_MODIFIED: VCS_WC_MODIFIED))!
  
  public var values : [(label: String, value: String?)]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    values = [(label: String, value: String?)]()
    values.append((label: "semverDescription", value: version.semver.description))
    values.append((label: "semverMajor", value: version.semver.major.description))
    values.append((label: "semverMinor", value: version.semver.minor.description))
    values.append((label: "semverPatch", value: version.semver.patch?.description))
    values.append((label: "build", value: version.build.description))
    values.append((label: "vcsBasename", value: version.versionControl!.BASENAME))
    values.append((label: "vcsBranch", value: version.versionControl!.BRANCH))
    values.append((label: "vcsDate", value: version.versionControl!.DATE?.description))
    values.append((label: "vcsExtra", value: version.versionControl!.EXTRA))
    values.append((label: "vcsFull_hash", value: version.versionControl!.FULL_HASH))
    values.append((label: "vcsNum", value: version.versionControl!.NUM.description))
    values.append((label: "vcsShortHash", value: version.versionControl!.SHORT_HASH))
    values.append((label: "vcsTag", value: version.versionControl!.TAG))
    values.append((label: "vcsTick", value: version.versionControl!.TICK?.description))
    values.append((label: "vcsType", value: version.versionControl!.TYPE.description))
    values.append((label: "vcsUuid", value: version.versionControl!.UUID))
    values.append((label: "vcsWc_modified", value: version.versionControl!.WC_MODIFIED.description))
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

