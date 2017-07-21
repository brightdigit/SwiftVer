import Foundation

/**
 Stage Enumeration.
 */
public enum Stage: CustomStringConvertible {
  /**
   Builds a StageBuildDictionaryProtocol from a plist.
   */
  public static func dictionary(fromPlistAtURL url: URL) -> StageBuildDictionaryProtocol? {

    guard let data = try? Data(contentsOf: url) else {
      return Stage.StageBuildDictionary.empty
    }

    guard let plistOpt = try? PropertyListSerialization.propertyList(
      from: data,
      options: PropertyListSerialization.ReadOptions(),
      format: nil) as? [String: [String: Int]],
      let plist = plistOpt else {
      return Stage.StageBuildDictionary.empty
    }

    let dictionary = plist.reduce(
      StageBuildDictionaryBase(), { (previous, pair) -> StageBuildDictionaryBase in
        var mutable = previous
        mutable[SemVer(versionString: pair.key)!] = pair.value.reduce(
          [Stage: Int](), { (previous, pair) -> [Stage: Int] in
            var mutable = previous
            mutable[Stage(string: pair.key)!] = Int(pair.value)
            return mutable
        })
        return mutable
    })

    return Stage.StageBuildDictionary(dictionary: dictionary)
  }

  /**
   Returns an empty StageBuildDictionaryProtocol.
   */
  public static var emptyDictionary: StageBuildDictionaryProtocol {
    return StageBuildDictionary.empty
  }

  private struct StageBuildDictionary: StageBuildDictionaryProtocol {
    func minimumBuild(forSemVer semver: SemVer, atStage stage: Stage?) -> Int? {
      if let stage = stage {
        guard let value = self.dictionary[semver]?[stage] else {
          return 1
        }
        return Int(value)
      } else if let value = dictionary[semver]?.min(by: type(of: self).compare(lhs:rhs:))?.value {
        return Int(value)
      } else {
        return nil
      }
    }

    public static let empty = StageBuildDictionary(dictionary: StageBuildDictionaryBase())
    public var semvers: [SemVer] {
      return Array(dictionary.keys)
    }

    let dictionary: StageBuildDictionaryBase

    public func stage(withBuildForVersion version: Version) -> StageBuild? {
      let result = dictionary[version.semver]?.filter {
        $0.value <= version.build
      }.max(by: { $0.value < $1.value })
      if let result = result {
        return (stage: result.key, minimum: result.value)
      } else {
        return nil
      }
    }

    static func compare(
      lhs: (key: Stage, value: Int),
      rhs: (key: Stage, value: Int)) -> Bool {
      return lhs.value < rhs.value
    }

    public init(dictionary: StageBuildDictionaryBase) {
      self.dictionary = dictionary
    }
  }

  /**
   A list of all the stages.
   */
  public static let all: Set<Stage> = [.alpha, .beta, .production]

  /**
   Alpha
   */
  case alpha,

    /**
      Beta
      */
    beta,

    /**
      Production
      */
    production

  /**
   Returns a String Description of the Stage.
   */
  public var description: String {
    switch self {
    case .alpha:
      return "alpha"
    case .beta:
      return "beta"
    case .production:
      return "production"
    }
  }

  /**
   Tries to create the Stage based on the String.
   */
  public init?(string: String) {
    for stage in Stage.all {
      if string.compare(
        stage.description,
        options: String.CompareOptions.caseInsensitive,
        range: nil,
        locale: nil) == ComparisonResult.orderedSame {
        self = stage
        return
      }
    }
    return nil
  }
}
