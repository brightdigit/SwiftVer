import Foundation

public struct Version {
  public let semver: SemVer
  public let build: UInt8
  public let versionControl: VersionControlInfo?
  public let dictionary: StageBuildDictionaryProtocol

  public struct InfoDictionaryKeys {
    public static let version = "CFBundleShortVersionString"
    public static let build = "CFBundleVersion"
  }

  /// :nodoc:
  public init?(bundle: VersionContainerProtocol, dictionary: StageBuildDictionaryProtocol, buildNumberCumulative: Bool, versionControl: VersionControlInfo? = nil) {
    let keys = type(of: self).InfoDictionaryKeys.self

    guard let versionString = bundle.infoDictionary?[keys.version] as? String else {
      return nil
    }

    guard let semver = SemVer(versionString: versionString) else {
      return nil
    }

    guard let buildValue = bundle.infoDictionary?[keys.build] else {
      return nil
    }

    let buildOpt: Int?

    if let buildInt = buildValue as? Int {
      buildOpt = Int(buildInt)
    } else if let buildString = buildValue as? String {
      buildOpt = Int(buildString)
    } else {
      return nil
    }

    guard let build = buildOpt else {
      return nil
    }

    self.dictionary = dictionary
    self.build = buildNumberCumulative ? UInt8(build - dictionary.minimumStageBuildNumber(forSemVer: semver) + 1) : UInt8(build)
    self.semver = semver
    self.versionControl = versionControl
  }
}
