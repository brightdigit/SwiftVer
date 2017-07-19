import Foundation

public protocol StageBuildDictionaryProtocol {
  func stage(withBuildForVersion version: Version) -> StageBuild?
  func minimumBuild(forSemVer semVer: SemVer) -> UInt8?
  var semvers: [SemVer] { get }
  func minimumStageBuildNumber(forSemVer semver: SemVer, atStage stage: Stage) -> Int
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
