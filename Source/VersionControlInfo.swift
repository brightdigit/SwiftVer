import Foundation

/**
 The Current-Revision Metadata from the Version Control Repository.
 */
public struct VersionControlInfo {

  /**
   The VersionControlType.
   */
  public let type: VersionControlType

  /**
   The basename of the directory root.
   */
  public let baseName: String

  /**
   A universally unique identifier, generated from the root commit in git and hg;
   for svn it uses the supplied UUID.
   */
  public let uuid: Hash?

  /**
   A count of revisions between the current one and the initial one; useful for reporting build numbers.
   */
  public let number: Int

  /**
   The date of the most recent commit.
   */
  public let date: Date?

  /**
   The name of the branch of the commit graph that was selected when autoversion was run.
   */
  public let branch: String

  /**
   The name of the most recent tag ancestral to the current commit.
   */
  public let tag: String?

  /**
   A count of commits since most recent tag ancestral to the current commit.
   */
  public let tick: Int?

  /**
   A symbol set aside specifically to be set by the user through the environment or via scripts.
   */
  public let extra: String?

  /**
   A full unique identifier for the current revision.
   */
  public let hash: Hash

  /**
   If the current working directory has been modified.
   */
  public let isWorkingCopyModified: Bool

  /**
   Creates a VersionControlInfo object.
   */
  public init(type: String,
              baseName: String,
              uuid: Hash?,
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

  /**
   Creates a VersionControlInfo object based a previous one with an updated tick and extra info.
   */
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

  private static func autorevisionDictionary(
    fromJsonResource name: String,
    bundle: ResourceContainerProtocol,
    inDirectory directory: String? = nil) -> [String: Any]? {

    guard let url = bundle.url(
      forResource: name,
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

    return dictionary
  }

  /**
   Tries to parse the json resource from the bundle based on the directory.
   */
  public init?(
    jsonResource: String,
    fromBundle bundle: ResourceContainerProtocol,
    inDirectory directory: String? = nil
  ) {
    guard let dictionary = VersionControlInfo.autorevisionDictionary(
      fromJsonResource: jsonResource,
      bundle: bundle,
      inDirectory: directory) else {
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

    let uuid: Hash?
    if let uuid_string = dictionary["VCS_UUID"] as? String {
      uuid = Hash(string: uuid_string)
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
