import Foundation

extension Dictionary where Value: Equatable {
  func allKeysForValue(val: Value) -> [Key] {
    return filter { $1 == val }.map { $0.0 }
  }
}

public enum VersionControlType: CustomStringConvertible {
  public static let lookup: [String: VersionControlType] = [
    "git": .git,
    "mercurial": .mercurial,
    "subversion": .subversion,
    "bazaar": .bazaar
  ]

  case git, mercurial, subversion, bazaar, unknown

  public init(TYPE: String) {
    if let value = VersionControlType.lookup[TYPE.lowercased()] {
      self = value
    } else {
      self = .unknown
    }
  }

  public var description: String {
    return VersionControlType.lookup.allKeysForValue(val: self).first?.capitalized ?? "Unknown"
  }
}
