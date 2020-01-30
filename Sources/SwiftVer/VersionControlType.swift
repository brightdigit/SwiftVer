import Foundation

extension Dictionary where Value: Equatable {
  func allKeysForValue(val: Value) -> [Key] {
    return filter { $1 == val }.map { $0.0 }
  }
}

/**
 Version Control Type.
 */
public enum VersionControlType: CustomStringConvertible {
  private static let lookup: [String: VersionControlType] = [
    "git": .git,
    "mercurial": .mercurial,
    "subversion": .subversion,
    "bazaar": .bazaar
  ]

  /**
   Git
   */
  case git,

    /**
      Mercurial
      */
    mercurial,

    /**
      Subversion
      */
    subversion,

    /**
      Bazaar
      */
    bazaar,

    /**
      Unknown **VersionControlType**
      */
    unknown

  /**
   Creates a **VersionControlType** based on the type **String**.
   */
  public init(string: String) {
    if let value = VersionControlType.lookup[string.lowercased()] {
      self = value
    } else {
      self = .unknown
    }
  }

  /**
   Returns a **String** of the **VersionControlType**.
   */
  public var description: String {
    return VersionControlType.lookup.allKeysForValue(val: self).first?.capitalized ?? "Unknown"
  }
}
