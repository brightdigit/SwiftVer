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
   Minimum Build Number for a Semantic Version and Stage.
   */
  func minimumBuild(forSemVer semver: SemVer, atStage stage: Stage?) -> Int?
  /**
   StageBuild based on Version
   */
  func stage(withBuildForVersion version: Version) -> StageBuild?
}

public extension StageBuildDictionaryProtocol {
  /**
   Minimum Build Number for a Semantic Version and Stage.
   */
  func minimumBuild(forSemVer semver: SemVer) -> Int? {
    return minimumBuild(forSemVer: semver, atStage: nil)
  }
}
