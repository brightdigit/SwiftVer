//
//  Version.Array.swift
//  iOS Example
//
//  Created by Leo Dion on 9/21/16.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

import Foundation
import SwiftVer

let _exampleVersion = Version(bundle: Bundle.main, versionControl: VersionControlInfo(TYPE: VCS_TYPE, BASENAME: VCS_BASENAME, UUID: VCS_UUID, NUM: VCS_NUM, DATE: VCS_DATE, BRANCH: VCS_BRANCH, TAG: VCS_TAG, TICK: VCS_TICK, EXTRA: VCS_EXTRA, FULL_HASH: VCS_FULL_HASH, SHORT_HASH: VCS_SHORT_HASH, WC_MODIFIED: VCS_WC_MODIFIED))

extension Version {
  var values : [(label: String, value: String?)] {
    var values = [(label: String, value: String?)]()
    values.append((label: "semverDescription", value: self.semver.description))
    values.append((label: "semverMajor", value: self.semver.major.description))
    values.append((label: "semverMinor", value: self.semver.minor.description))
    values.append((label: "semverPatch", value: self.semver.patch?.description))
    values.append((label: "build", value: self.build.description))
    values.append((label: "vcsBasename", value: self.versionControl!.BASENAME))
    values.append((label: "vcsBranch", value: self.versionControl!.BRANCH))
    values.append((label: "vcsDate", value: self.versionControl!.DATE?.description))
    values.append((label: "vcsExtra", value: self.versionControl!.EXTRA))
    values.append((label: "vcsFull_hash", value: self.versionControl!.FULL_HASH))
    values.append((label: "vcsNum", value: self.versionControl!.NUM.description))
    values.append((label: "vcsShortHash", value: self.versionControl!.SHORT_HASH))
    values.append((label: "vcsTag", value: self.versionControl!.TAG))
    values.append((label: "vcsTick", value: self.versionControl!.TICK?.description))
    values.append((label: "vcsType", value: self.versionControl!.TYPE.description))
    values.append((label: "vcsUuid", value: self.versionControl!.UUID))
    values.append((label: "vcsWc_modified", value: self.versionControl!.WC_MODIFIED.description))
    return values
  }
  
  static var example : Version! {
    return _exampleVersion
  }
}
