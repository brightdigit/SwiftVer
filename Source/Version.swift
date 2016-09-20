//
//  Version.swift
//  swiftver
//
//  Created by Leo Dion on 11/25/15.
//  Copyright © 2015 BrightDigit. All rights reserved.
//

import Foundation

public enum VersionControlType {
  public static let lookup: [String:VersionControlType] = ["Git": .git, "Mercurial": .mercurial, "Subversion": .subversion, "Bazaar" : .bazaar]
  case git, mercurial, subversion, bazaar, unknown
  
  public init (TYPE: String) {
    if let value = VersionControlType.lookup[TYPE] {
      self = value
    } else {
      self = .unknown
    }
  }
}

public struct VersionControlInfo {
  public let TYPE:VersionControlType
  public let BASENAME:String
  public let UUID:	String?
  public let NUM:	Int
  public let DATE: Date?
  public let BRANCH:	String
  public let TAG:	String?
  public let TICK:	Int?
  public let EXTRA:	String?
  
  public let FULL_HASH:		String
  public let SHORT_HASH:		String
  
  public let WC_MODIFIED:	Bool
  
  public init (TYPE:String
    ,BASENAME:String
    ,UUID: String?
    ,NUM:  Int
    ,DATE: String
    ,BRANCH: String
    ,TAG:  String?
    ,TICK: Int?
    ,EXTRA:  String?
    
    ,FULL_HASH:    String
    ,SHORT_HASH:   String
    
    ,WC_MODIFIED:  Bool) {
      self.TYPE = VersionControlType(TYPE: TYPE)
      self.BASENAME = BASENAME
      self.UUID = UUID
      self.NUM = NUM
      self.DATE = date(forRFC3339DateTimeString: DATE)
      self.BRANCH = BRANCH
      self.TAG = TAG
      self.TICK = TICK
      self.EXTRA = EXTRA
      self.FULL_HASH = FULL_HASH
      self.SHORT_HASH = SHORT_HASH
      self.WC_MODIFIED = WC_MODIFIED
  }
}

public struct SemVer : CustomStringConvertible  {
  public let Major:UInt8
  public let Minor:UInt8
  public let Patch:UInt8?
  
  public init?(versionString: String) {
    let values = versionString.components(separatedBy: ".").flatMap{  UInt8($0) }
    if values.count == 2 || values.count == 3 {
      self.Major = values.first!
      self.Minor = values[1]
      self.Patch = values.count == 3 ? values[2] : nil
    } else {
      return nil
    }
  }
  
  public var description:String {
    if let patch = self.Patch {
      return "\(self.Major).\(self.Minor).\(patch)"
    } else {
      return "\(self.Major).\(self.Minor)"
    }
  }
}

public struct Version {
  public let version:SemVer
  public let build:UInt8
  public let versionControl: VersionControlInfo?
  
  public init?(bundle: Bundle, versionControl: VersionControlInfo? = nil) {
    guard let versionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String else {
      return nil
    }
    
    guard let version = SemVer(versionString: versionString) else {
      return nil
    }
    
    
    guard let buildString = bundle.infoDictionary?["CFBundleVersion"] as? String else {
      return nil
    }
    
    guard let build = UInt8(buildString) else {
      return nil
    }
    
    self.build = build
    self.version = version
    self.versionControl = versionControl
  }
}
