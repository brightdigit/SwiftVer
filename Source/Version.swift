import Foundation

/**
 Complete Version Information.
 */
public struct Version: CustomStringConvertible {
  private struct InfoDictionaryKeys {
    public static let version = "CFBundleShortVersionString"
    public static let build = "CFBundleVersion"
  }

//  private static let suffixFormatter: NumberFormatter = {
//    Version.suffixFormatter(forLocale: nil)
//  }()

  /**
   Semantic Version.
   */
  public let semver: SemVer

  /**
   Build Number.
   */
  public let build: Int

  /**
   Autorevision Version Control Info.
   */
  public let versionControl: VersionControlInfo?

  /**
   Semantic Version, Build Number, and Stage Dictionary.
   */
  public let dictionary: StageBuildDictionaryProtocol

  /**
   Create a Version based on a **SemVer**, Build Number, **StageBuildDictionaryProtocol**,
   and an optional **VersionControlInfo**.
   */
  public init(semver: SemVer, build: Int,
              dictionary: StageBuildDictionaryProtocol,
              versionControlInfo: VersionControlInfo? = nil) {
    self.semver = semver
    self.build = build
    versionControl = versionControlInfo
    self.dictionary = dictionary
  }

  /**
   Create a Version based on a Cumulative Build Number, **StageBuildDictionaryProtocol**,
   and an optional **VersionControlInfo**.
   */
  public init(
    cumulativeBuildNumber: Int,
    dictionary: StageBuildDictionaryProtocol,
    versionControlInfo: VersionControlInfo? = nil
  ) {
    let semvers = dictionary.semvers
    let semverMinBuilds = semvers.map {
      (semver: $0, minBuildNumber: dictionary.minimumBuild(forSemVer: $0) ?? Int.max)
    }

    let pair = semverMinBuilds.filter {
      $0.minBuildNumber <= cumulativeBuildNumber
    }.max(by: {
      $0.minBuildNumber < $1.minBuildNumber
    })!
    self.dictionary = dictionary
    semver = pair.semver
    build = Int(cumulativeBuildNumber)
    versionControl = versionControlInfo
  }

  /**
   Create a Version based on a Bundle, **StageBuildDictionaryProtocol**,
   and an optional **VersionControlInfo**.
   */
  public init?(
    bundle: InfoDictionaryContainerProtocol,
    dictionary: StageBuildDictionaryProtocol,
    versionControl: VersionControlInfo? = nil
  ) {
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
    self.build = Int(build)
    self.semver = semver
    self.versionControl = versionControl
  }

  /**
   Create a Version based on a Bundle, **StageBuildDictionaryProtocol**,
   and the name of the json resource file from autorevision.
   */
  public static func from(
    bundle: ResourceContainerProtocol & InfoDictionaryContainerProtocol,
    dictionary: StageBuildDictionaryProtocol,
    withVersionControlInfoWithJsonResource resource: String
  ) -> Version? {
    let versionControlInfo = VersionControlInfo(jsonResource: resource, fromBundle: bundle)
    return Version(
      bundle: bundle,
      dictionary: dictionary,
      versionControl: versionControlInfo
    )
  }

  private var extra: Double {
    if let extraString = self.versionControl?.extra {
      return Double(extraString) ?? 0
    } else {
      return 0
    }
  }

  /**
   Creates a formatted string from the Version.
   */
  public var description: String {
    return shortDescription
  }

  /**
   The build number offset based on the Version stage.
   Note: Starts at 1.
   */
  public var stageBuildNumber: Int? {
    guard let stage = self.stage, let minimumBuild = dictionary.minimumBuild(forSemVer: semver, atStage: stage) else {
      return nil
    }
    return Int(build) - minimumBuild + 1
  }

  /**
   The build number offset based on the Version Semantic Version.
   Note: Starts at 1.
   */
  public var semverBuildNumber: Int {
    return Int(build) - (dictionary.minimumBuild(forSemVer: semver) ?? 1) + 1
  }

  /**
   The stage based on the Version.
   */
  public var stage: Stage? {
    return dictionary.stage(withBuildForVersion: self)?.stage
  }

  public func suffixFormatter(forLocale locale: Locale?) -> NumberFormatter {
    let formatter = NumberFormatter()
    if let locale = locale {
      formatter.locale = locale
    }
    formatter.minimumFractionDigits = 10
    formatter.minimumIntegerDigits = 1
    return formatter
  }

  public func fullDescription(withLocale locale: Locale?) throws -> String {
    let formatter = suffixFormatter(forLocale: locale)
    return try fullDescription(withFormatter: formatter)
  }

  public func fullDescription(withFormatter formatter: NumberFormatter) throws -> String {
    guard let formattedNumber = formatter.string(for: subSemVerValue) else {
      throw VersionNumberSuffixFormatError(formatter: formatter, value: subSemVerValue)
    }
    let components = formattedNumber.components(separatedBy: formatter.decimalSeparator)
    guard components.count == 2 else {
      throw VersionNumberSuffixParseError(formatter: formatter, value: subSemVerValue)
    }
    let suffixString = components[1]
    return "\(semver).\(suffixString)"
  }

  /**
   A Full Descripton which also contains the Sub-Semantic Version value
   parsed from the VersionControlInfo.
   */
  @available(*, deprecated: 2.0.4, message: "Use function calls instead.")
  public var fullDescription: String {
    // swiftlint:disable:next force_try
    return try! fullDescription(withLocale: nil)
  }

  /**
   The Sub-Semantic Version value parsed from the VersionControlInfo.
   */
  public var subSemVerValue: Double {
    return (Double(semverBuildNumber) +
      (Double(versionControl?.tick ?? 0) + extra / 1000.0)
      / 10000.0) / 100.0
  }

  /**
   Creates a shortened formatted string from the Version.
   */
  public var shortDescription: String {
    let stage: Stage
    let minimumBuild: Int
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
}
