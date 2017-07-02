import Foundation
import SwiftVer

/// :nodoc:
extension SemVer: Hashable {
  public var hashValue: Int {
    return description.hashValue
  }
}

/// :nodoc:
public typealias StageBuildDictionaryBase = [SemVer: [Stage: UInt8]]

/// :nodoc:
public typealias StageBuild = (stage: Stage, minimum: UInt8)

/// :nodoc:
public protocol SemVerSequence: Sequence {
  associatedtype Iterator = SemVer
}

/// :nodoc:
public protocol StageBuildDictionaryProtocol {
  func stage(withBuildForVersion version: Version) -> StageBuild?
  func minimumBuild(forSemVer semVer: SemVer) -> UInt8?
  var semvers: [SemVer] { get }
}

/// :nodoc:
public enum Stage: CustomStringConvertible {
  public struct StageBuildDictionary: StageBuildDictionaryProtocol {
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
      lhs: (key: Stage, value: UInt8),
      rhs: (key: Stage, value: UInt8)) -> Bool {
      return lhs.value < rhs.value
    }

    public func minimumBuild(forSemVer semVer: SemVer) -> UInt8? {
      return dictionary[semVer]?.min(by: type(of: self).compare(lhs:rhs:))?.value
    }

    public init(dictionary: StageBuildDictionaryBase) {
      self.dictionary = dictionary
    }
  }

  public static let all: Set<Stage> = [.alpha, .beta, .production]
  case alpha, beta, production

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

  //  public static let dictionary: StageBuildDictionaryProtocol! = {
  //    guard let url = ConferencesBundles.framework.url(
  //      forResource: "versions",
  //      withExtension: "plist") else {
  //      return StageBuildDictionary.empty
  //    }
  //
  //    guard let data = try? Data(contentsOf: url) else {
  //      return StageBuildDictionary.empty
  //    }
  //
  //    guard let plistOpt = try? PropertyListSerialization.propertyList(
  //      from: data,
  //      options: PropertyListSerialization.ReadOptions(),
  //      format: nil) as? [String: [String: Int]],
  //      let plist = plistOpt else {
  //      return StageBuildDictionary.empty
  //    }
  //
  //    let dictionary = plist.reduce(
  //      StageBuildDictionaryBase(), { (previous, pair) -> StageBuildDictionaryBase in
  //        var mutable = previous
  //        mutable[SemVer(versionString: pair.key)!] = pair.value.reduce(
  //          [Stage: UInt8](), { (previous, pair) -> [Stage: UInt8] in
  //            var mutable = previous
  //            mutable[Stage(string: pair.key)!] = UInt8(pair.value)
  //            return mutable
  //        })
  //        return mutable
  //    })
  //
  //    return StageBuildDictionary(dictionary: dictionary)
  //  }()
}
