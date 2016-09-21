//
//  Version.swift
//  swiftver
//
//  Created by Leo Dion on 11/25/15.
//  Copyright © 2015 BrightDigit. All rights reserved.
//

import Foundation

public struct Version {
  public let semver:SemVer
  public let build:UInt8
  public let versionControl: VersionControlInfo?
  
  public init?(bundle: Bundle, versionControl: VersionControlInfo? = nil) {
    guard let versionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String else {
      return nil
    }
    
    guard let semver = SemVer(versionString: versionString) else {
      return nil
    }
    
    
    guard let buildString = bundle.infoDictionary?["CFBundleVersion"] as? String else {
      return nil
    }
    
    guard let build = UInt8(buildString) else {
      return nil
    }
    
    self.build = build
    self.semver = semver
    self.versionControl = versionControl
  }
}
