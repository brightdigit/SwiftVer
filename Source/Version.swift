import Foundation

public struct Version: CustomStringConvertible {
  public let semver: SemVer
  public let build: UInt8
  public let versionControl: VersionControlInfo?
  public let dictionary: StageBuildDictionaryProtocol

  public struct InfoDictionaryKeys {
    public static let version = "CFBundleShortVersionString"
    public static let build = "CFBundleVersion"
  }

  public static let suffixFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 10
    formatter.minimumIntegerDigits = 1
    return formatter
  }()

  public init?(
    bundle: InfoDictionaryContainerProtocol,
    dictionary: StageBuildDictionaryProtocol,
    versionControl: VersionControlInfo? = nil) {
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
    self.build = UInt8(build)
    self.semver = semver
    self.versionControl = versionControl
  }
  public var description: String {
    return shortDescription
  }

  public var stageBuildNumber: Int? {
    guard let stage = self.stage else {
      return nil
    }
    return Int(build) - dictionary.minimumStageBuildNumber(forSemVer: semver, atStage: stage) + 1
  }

  public var semverBuildNumber: Int {
    return Int(build) - dictionary.minimumSemVerBuildNumber(forSemVer: semver) + 1
  }

  public var stage: Stage? {
    return dictionary.stage(withBuildForVersion: self)?.stage
  }

  public var fullDescription: String {
    let suffixString = Version.suffixFormatter.string(for: subSemVerValue)!.components(separatedBy: ".")[1]
    return "\(semver).\(suffixString)"
  }

  public var subSemVerValue: Double {
    return (Double(semverBuildNumber) +
      (Double(versionControl?.TICK ?? 0) + extra / 1000.0)
      / 10000.0) / 100.0
  }

  public var extra: Double {
    if let extraString = self.versionControl?.EXTRA {
      return Double(extraString) ?? 0
    } else {
      return 0
    }
  }

  public var shortDescription: String {
    let stage: Stage
    let minimumBuild: UInt8
    if let stagebuild = self.dictionary.stage(withBuildForVersion: self) {
      stage = stagebuild.stage
      minimumBuild = stagebuild.minimum - 1
    } else {
      stage = .production
      minimumBuild = 0
    }
    switch stage {
    case .production:
      return "\(semver) (\(String(format: "%04X", build)))"
    default:
      return "\(semver)-\(stage)\(build - minimumBuild)"
    }
  }

  public static func from(
    bundle: ResourceContainerProtocol & InfoDictionaryContainerProtocol,
    dictionary: StageBuildDictionaryProtocol,
    withVersionControlInfoWithJsonResource resource: String) -> Version? {
    let versionControlInfo = VersionControlInfo(jsonResource: resource, fromBundle: bundle)
    return Version(
      bundle: bundle,
      dictionary: dictionary,
      versionControl: versionControlInfo)
  }

  public init(semver: SemVer, nonCumulativeBuildNumber: UInt8,
              dictionary: StageBuildDictionaryProtocol) {
    self.semver = semver
    build = nonCumulativeBuildNumber
    versionControl = nil
    self.dictionary = dictionary
  }

  public init(cumulativeBuildNumber: Int, dictionary: StageBuildDictionaryProtocol) {
    let semvers = dictionary.semvers
    let semverMinBuilds = semvers.map {
      (semver: $0, minBuildNumber: dictionary.minimumSemVerBuildNumber(forSemVer: $0))
    }

    let pair = semverMinBuilds.filter {
      $0.minBuildNumber <= cumulativeBuildNumber
    }.max(by: {
      $0.minBuildNumber < $1.minBuildNumber
    })!
    self.dictionary = dictionary
    semver = pair.semver
    build = UInt8(cumulativeBuildNumber)
    versionControl = nil
  }
}
