import Foundation
import SwiftVer

/// :nodoc:
let formatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.minimumFractionDigits = 9
  formatter.minimumIntegerDigits = 1
  return formatter
}()

extension Version: CustomStringConvertible {
  /// :nodoc:
  public var description: String {
    return shortDescription
  }
}

extension StageBuildDictionaryProtocol {
  /// :nodoc:
  public func minimumStageBuildNumber(forSemVer semver: SemVer) -> Int {
    let version = Version(semver: semver, nonCumulativeBuildNumber: 1, dictionary: self)
    let stageBuild = stage(withBuildForVersion: version)
    return Int(stageBuild?.minimum ?? 1)
  }

  /// :nodoc:
  public func minimumSemVerBuildNumber(forSemVer semver: SemVer) -> Int {
    let minSemVer = semvers.min { (lhs, rhs) -> Bool in
      return lhs < rhs
    }
    if semver == minSemVer {
      return 1
    } else {
      return Int(minimumBuild(forSemVer: semver) ?? 1)
    }
  }
}

public extension Version {
  /// :nodoc:
  public var buildNumber: Int {
    return Int(build) - dictionary.minimumStageBuildNumber(forSemVer: semver) + 1
  }

  public var semverMiniumBuild: Int {
    return Int(build) - dictionary.minimumSemVerBuildNumber(forSemVer: semver) + 1
  }

  /// :nodoc:
  public var stage: Stage? {
    return dictionary.stage(withBuildForVersion: self)?.stage
  }

  /// :nodoc:
  public var fullDescription: String {
    let suffix = self.suffix
    let suffixString = formatter.string(for: suffix)!.components(separatedBy: ".")[1]
    return "\(self.semver).\(suffixString)"
  }

  /// :nodoc:
  public var suffix: Double {
    return (Double(semverMiniumBuild) +
      (Double(versionControl?.TICK ?? 0) + extra / 1000.0)
      / 10000.0) / 100.0
  }

  /// :nodoc:
  public var extra: Double {
    if let extraString = self.versionControl?.EXTRA {
      return Double(extraString) ?? 0
    } else {
      return 0
    }
  }

  /// :nodoc:
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
      return "\(self.semver) (\(String(format: "%04X", self.build)))"
    default:
      return "\(self.semver)-\(stage)\(self.build - minimumBuild)"
    }
  }

  /// :nodoc:
  public static func from(
    bundle: Bundle,
    dictionary: StageBuildDictionaryProtocol,
    buildNumberCumulative: Bool,
    withVersionControlInfoWithJsonResource resource: String) -> Version? {
    let versionControlInfo = VersionControlInfo(jsonResource: resource, fromBundle: bundle)
    return Version(bundle: bundle, dictionary: dictionary, buildNumberCumulative: buildNumberCumulative, versionControl: versionControlInfo)
  }

  /// :nodoc:
  public init(semver: SemVer, nonCumulativeBuildNumber: UInt8,
              dictionary: StageBuildDictionaryProtocol) {
    self.semver = semver
    build = nonCumulativeBuildNumber
    versionControl = nil
    self.dictionary = dictionary
  }

  /// :nodoc:
  public init(cumulativeBuildNumber: Int, dictionary: StageBuildDictionaryProtocol) {
    let semvers = dictionary.semvers
    let semverMinBuilds = semvers.map {
      (semver: $0, minBuildNumber: dictionary.minimumStageBuildNumber(forSemVer: $0))
    }

    let pair = semverMinBuilds.filter {
      $0.minBuildNumber <= cumulativeBuildNumber
    }.min(by: {
      $0.minBuildNumber < $1.minBuildNumber
    })!
    self.dictionary = dictionary
    semver = pair.semver
    build = UInt8(cumulativeBuildNumber - pair.minBuildNumber + 1)
    versionControl = nil
  }
}
