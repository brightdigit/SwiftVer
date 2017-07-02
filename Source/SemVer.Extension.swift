import Foundation
import SwiftVer

public extension SemVer {
  /// :nodoc:
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
}

extension SemVer: Comparable, Equatable {

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
}
