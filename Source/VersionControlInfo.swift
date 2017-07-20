import Foundation

// TODO: replace properties with friendly names
public struct VersionControlInfo {
  public let type: VersionControlType
  public let baseName: String
  public let uuid: UUID?
  public let number: Int
  public let date: Date?
  public let branch: String
  public let tag: String?
  public let tick: Int?
  public let extra: String?

  public let hash: Hash

  public let isWorkingCopyModified: Bool

  public init(type: String,
              baseName: String,
              uuid: UUID?,
              number: Int,
              date: String,
              branch: String,
              tag: String?,
              tick: Int?,
              extra: String?,
              hash: String,

              isWorkingCopyModified: Bool) {
    self.type = VersionControlType(string: type)
    self.baseName = baseName
    self.uuid = uuid
    self.number = number
    self.date = DateFormatter.rfc3339DateFormatter.date(from: date)
    self.branch = branch
    self.tag = tag
    self.tick = tick
    self.extra = extra
    self.hash = Hash(string: hash)
    self.isWorkingCopyModified = isWorkingCopyModified
  }

  public init(basedOn parent: VersionControlInfo, tick: Int, extra: String?) {
    type = parent.type
    baseName = parent.baseName
    uuid = nil
    number = parent.number
    date = nil
    branch = parent.branch
    tag = nil
    self.tick = tick
    self.extra = extra
    hash = parent.hash
    isWorkingCopyModified = parent.isWorkingCopyModified
  }

  public init?(
    jsonResource: String,
    fromBundle bundle: ResourceContainerProtocol,
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

    guard let hash_string = dictionary["VCS_FULL_HASH"] as? String else {
      return nil
    }

    guard let wc_modified = dictionary["VCS_WC_MODIFIED"] as? Bool else {
      return nil
    }

    let type: VersionControlType
    if let type_string = dictionary["VCS_TYPE"] as? String {
      type = VersionControlType(string: type_string)
    } else {
      type = .unknown
    }

    let date_value: Date?
    if let date_string = dictionary["VCS_DATE"] as? String {
      date_value = DateFormatter.rfc3339DateFormatter.date(from: date_string)
    } else {
      date_value = nil
    }

    let uuid: UUID?
    if let uuid_string = dictionary["VCS_UUID"] as? String {
      uuid = UUID(uuidString: uuid_string)
    } else {
      uuid = nil
    }

    self.type = type
    baseName = basename
    self.uuid = uuid
    number = num
    date = date_value
    self.branch = branch
    tag = dictionary["VCS_TAG"] as? String
    tick = dictionary["VCS_TICK"] as? Int
    extra = dictionary["VCS_EXTRA"] as? String
    hash = Hash(string: hash_string)
    isWorkingCopyModified = wc_modified
  }
}
