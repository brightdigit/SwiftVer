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

  public init(TYPE: String,
              BASENAME: String,
              UUID: String?,
              NUM: Int,
              DATE: String,
              BRANCH: String,
              TAG: String?,
              TICK: Int?,
              EXTRA: String?,

              FULLHASH: String,
              SHORTHASH: String,

              MODIFIED: Bool) {
    self.TYPE = VersionControlType(TYPE: TYPE)
    self.BASENAME = BASENAME
    self.UUID = UUID
    self.NUM = NUM
    self.DATE = RFC3339DateFormatter.instance.date(from: DATE)
    self.BRANCH = BRANCH
    self.TAG = TAG
    self.TICK = TICK
    self.EXTRA = EXTRA
    self.FULLHASH = FULLHASH
    self.SHORTHASH = SHORTHASH
    self.MODIFIED = MODIFIED
  }

  public init(basedOn parent: VersionControlInfo, TICK: Int, EXTRA: String?) {
    TYPE = parent.TYPE
    BASENAME = parent.BASENAME
    UUID = nil
    NUM = parent.NUM
    DATE = nil
    BRANCH = parent.BRANCH
    TAG = nil
    self.TICK = TICK
    self.EXTRA = EXTRA
    FULLHASH = parent.FULLHASH
    SHORTHASH = parent.SHORTHASH
    MODIFIED = parent.MODIFIED
  }

  public init?(
    jsonResource: String,
    fromBundle bundle: Bundle,
    inDirectory directory: String? = nil
  ) {
    guard let url = bundle.url(
      forResource: jsonResource,
      withExtension: "json",
      subdirectory: directory) else {
      return nil
    }

    guard let data: Data = try? Data(contentsOf: url) else {
      return nil
    }

    guard let jsonObject: Any = try? JSONSerialization.jsonObject(
      with: data,
      options: JSONSerialization.ReadingOptions()) else {
      return nil
    }

    guard let dictionary: [String: Any] = jsonObject as? [String: Any] else {
      return nil
    }

    guard let basename = dictionary["VCS_BASENAME"] as? String else {
      return nil
    }

    guard let num = dictionary["VCS_NUM"] as? Int else {
      return nil
    }

    guard let branch = dictionary["VCS_BRANCH"] as? String else {
      return nil
    }

    guard let full_hash = dictionary["VCS_FULL_HASH"] as? String else {
      return nil
    }

    guard let short_hash = dictionary["VCS_SHORT_HASH"] as? String else {
      return nil
    }

    guard let wc_modified = dictionary["VCS_WC_MODIFIED"] as? Bool else {
      return nil
    }

    let type: VersionControlType
    if let type_string = dictionary["VCS_TYPE"] as? String {
      type = VersionControlType(TYPE: type_string)
    } else {
      type = .unknown
    }

    let date_value: Date?
    if let date_string = dictionary["VCS_DATE"] as? String {
      date_value = RFC3339DateFormatter.instance.date(from: date_string)
    } else {
      date_value = nil
    }

    TYPE = type
    BASENAME = basename
    UUID = dictionary["VCS_UUID"] as? String
    NUM = num
    DATE = date_value
    BRANCH = branch
    TAG = dictionary["VCS_TAG"] as? String
    TICK = dictionary["VCS_TICK"] as? Int
    EXTRA = dictionary["VCS_EXTRA"] as? String
    FULLHASH = full_hash
    SHORTHASH = short_hash
    MODIFIED = wc_modified
  }
}
