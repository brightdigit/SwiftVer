//
//  Version.swift
//  swiftver
//
//  Created by Leo Dion on 11/25/15.
//  Copyright © 2015 BrightDigit. All rights reserved.
//

import Foundation

public enum VersionControlType {
  public static let lookup: [String:VersionControlType] = ["Git": .Git, "Mercurial": .Mercurial, "Subversion": .Subversion, "Bazaar" : .Bazaar]
  //Git, Mercurial, Subversion, Bazaar, Unknown
  case Git, Mercurial, Subversion, Bazaar, Unknown
  
  public init (TYPE: String) {
    if let value = VersionControlType.lookup[TYPE] {
      self = value
    } else {
      self = .Unknown
    }
  }
}

public struct VersionControlInfo {
  public let TYPE:VersionControlType
  public let BASENAME:String
  public let UUID:	String?
  public let NUM:	Int
  public let DATE: NSDate?
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

public struct Version {
  public let version:Float
  public let build:UInt8
  public let versionControl: VersionControlInfo?
  
  public init?(bundle: Bundle, versionControl: VersionControlInfo? = nil) {
    guard let versionString = bundle.infoDictionary?["CFBundleShortVersionString"] as? String else {
      return nil
    }
    
    guard let version = Float(versionString) else {
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
