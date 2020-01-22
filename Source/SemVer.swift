import Foundation

/**
 Semantic Version.
 */
public struct SemVer: CustomStringConvertible, Comparable, Equatable, Hashable {
  /**
   Major version number when you make incompatible API changes.
   */
  public let major: Int

  /**
   Minor version when you add functionality in a backwards-compatible manner.
   */
  public let minor: Int

  /**
   Patch version when you make backwards-compatible bug fixes.
   */
  public let patch: Int?

  /**
   Creates Semantic Version Object.
   */
  public init(major: Int, minor: Int, patch: Int? = nil) {
    self.major = major
    self.minor = minor
    self.patch = patch
  }

  /**
   Creates Semantic Version Object from a String.
   */
  public init?(versionString: String) {
    let values = versionString.components(separatedBy: ".").map { Int($0) }

    if case let major?? = values.first, let minor = values[1], values.count == 2 || values.count == 3 {
      self.major = major
      self.minor = minor
      self.patch = values.count == 3 ? values[2] : nil
    } else {
      return nil
    }
  }

  /**
   Creates Semantic Version Object from a series of Strings.
   */
  public init?(major: String, minor: String, patch: String? = nil) {
    guard let majorValue = Int(major) else {
      return nil
    }

    guard let minorValue = Int(minor) else {
      return nil
    }

    let patchValue = patch.flatMap(Int.init)
    self.major = majorValue
    self.minor = minorValue
    self.patch = patchValue
  }

  /**
   Formatted SemVer String.
   */
  public var description: String {
    if let patch = self.patch {
      return "\(major).\(minor).\(patch)"
    } else {
      return "\(major).\(minor)"
    }
  }

  /**
   HashValue for comparison.
   */
  public var hashValue: Int {
    return description.hashValue
  }

  private var patchCalculated: Int {
    return patch ?? 0
  }

  /**
   Equality comparison of SemVer objects.
   */
  public static func == (lhs: SemVer, rhs: SemVer) -> Bool {
    return lhs.major == rhs.major &&
      lhs.minor == rhs.minor &&
      lhs.patch == rhs.patch
  }

  /**
   Comparison of SemVer objects.
   */
  public static func < (lhs: SemVer, rhs: SemVer) -> Bool {
    return lhs.major < rhs.major ||
      (lhs.major == rhs.major && lhs.minor < rhs.minor) ||
      (lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patchCalculated < rhs.patchCalculated)
  }
}
