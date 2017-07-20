import Foundation

/**
 Dictionary which has Semantic Versions, Stages, and Minimum Builds.
 */
public protocol StageBuildDictionaryProtocol {
  /**
   List of all Semantic Versions.
   */
  var semvers: [SemVer] { get }
  /**
   Minimum Build Number for a Semantic Version.
   */
  func minimumBuild(forSemVer semVer: SemVer) -> UInt8?
  /**
   Minimum Build Number for a Semantic Version and Stage.
   */
  func minimumStageBuildNumber(forSemVer semver: SemVer, atStage stage: Stage) -> Int
  /**
   StageBuild based on Version
   */
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
