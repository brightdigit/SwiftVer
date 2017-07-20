import Foundation

public protocol StageBuildDictionaryProtocol {
  var semvers: [SemVer] { get }
  func minimumBuild(forSemVer semVer: SemVer) -> UInt8?
  func minimumStageBuildNumber(forSemVer semver: SemVer, atStage stage: Stage) -> Int
  func stage(withBuildForVersion version: Version) -> StageBuild?
}

extension StageBuildDictionaryProtocol {
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
