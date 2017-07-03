import Foundation

public struct SemVer: CustomStringConvertible, Comparable, Equatable, Hashable {
  public let major: UInt8
  public let minor: UInt8
  public let patch: UInt8?

  public init?(versionString: String) {
    let values = versionString.components(separatedBy: ".").map { UInt8($0) }

    if case let major?? = values.first, let minor = values[1], values.count == 2 || values.count == 3 {
      self.major = major
      self.minor = minor
      self.patch = values.count == 3 ? values[2] : nil
    } else {
      return nil
    }
  }

  public var description: String {
    if let patch = self.patch {
      return "\(self.major).\(self.minor).\(patch)"
    } else {
      return "\(self.major).\(self.minor)"
    }
  }

  public init?(major: String, minor: String, patch: String? = nil) {
    guard let majorValue = UInt8(major) else {
      return nil
    }

    guard let minorValue = UInt8(minor) else {
      return nil
    }

    let patchValue: UInt8?
    if let patchStr = patch {
      guard let _patchValue = UInt8(patchStr) else {
        return nil
      }
      patchValue = _patchValue
    } else {
      patchValue = nil
    }

    self.major = majorValue
    self.minor = minorValue
    self.patch = patchValue
  }

  private var patchCalculated: UInt8 {
    return patch ?? 0
  }

  public static func == (lhs: SemVer, rhs: SemVer) -> Bool {
    return lhs.major == rhs.major &&
      lhs.minor == rhs.minor &&
      lhs.patch == rhs.patch
  }

  public static func < (lhs: SemVer, rhs: SemVer) -> Bool {
    return lhs.major < rhs.major ||
      (lhs.major == rhs.major && lhs.minor < rhs.minor) ||
      (lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patchCalculated < rhs.patchCalculated)
  }

  public var hashValue: Int {
    return description.hashValue
  }
}
