//
//  Version.swift
//  swiftver
//
//  Created by Leo Dion on 11/25/15.
//  Copyright © 2015 BrightDigit. All rights reserved.
//

import Foundation

extension Dictionary where Value : Equatable {
  func allKeysForValue(val : Value) -> [Key] {
    return self.filter { $1 == val }.map { $0.0 }
  }
}

public enum VersionControlType : CustomStringConvertible {
  public static let lookup: [String:VersionControlType] = ["git": .git, "mercurial": .mercurial, "subversion": .subversion, "bazaar" : .bazaar]
  case git, mercurial, subversion, bazaar, unknown
  
  public init (TYPE: String) {
    if let value = VersionControlType.lookup[TYPE.lowercased()] {
      self = value
    } else {
      self = .unknown
    }
  }
  
  public var description: String {
    return VersionControlType.lookup.allKeysForValue(val: self).first ?? "Unknown"
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
  public let major:UInt8
  public let minor:UInt8
  public let patch:UInt8?
  
  public init?(versionString: String) {
    let values = versionString.components(separatedBy: ".").flatMap{  UInt8($0) }
    if values.count == 2 || values.count == 3 {
      self.major = values.first!
      self.minor = values[1]
      self.patch = values.count == 3 ? values[2] : nil
    } else {
      return nil
    }
  }
  
  public var description:String {
    if let patch = self.patch {
      return "\(self.major).\(self.minor).\(patch)"
    } else {
      return "\(self.major).\(self.minor)"
    }
  }
}

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
