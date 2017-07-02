import Foundation

// TODO: replace properties with friendly names
public struct VersionControlInfo {
  public let TYPE: VersionControlType
  public let BASENAME: String
  public let UUID: String?
  public let NUM: Int
  public let DATE: Date?
  public let BRANCH: String
  public let TAG: String?
  public let TICK: Int?
  public let EXTRA: String?

  public let FULLHASH: String
  public let SHORTHASH: String

  public let MODIFIED: Bool

  public init(TYPE: String
              , BASENAME: String
              , UUID: String?
              , NUM: Int
              , DATE: String
              , BRANCH: String
              , TAG: String?
              , TICK: Int?
              , EXTRA: String?

              , FULLHASH: String
              , SHORTHASH: String

              , MODIFIED: Bool) {
    self.TYPE = VersionControlType(TYPE: TYPE)
    self.BASENAME = BASENAME
    self.UUID = UUID
    self.NUM = NUM
    self.DATE = date(forRFC3339DateTimeString: DATE)
    self.BRANCH = BRANCH
    self.TAG = TAG
    self.TICK = TICK
    self.EXTRA = EXTRA
    self.FULLHASH = FULLHASH
    self.SHORTHASH = SHORTHASH
    self.MODIFIED = MODIFIED
  }
}
