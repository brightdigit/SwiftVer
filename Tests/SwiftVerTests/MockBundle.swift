import Foundation
@testable import SwiftVer

struct MockBundle: VersionContainerProtocol {
  public static let globalBuildNumberDictionary: StageBuildDictionaryProtocol! =
    Stage.dictionary(
      fromPlistAtURL:
        Bundle(for: GlobalVersionTests.self).url(
          forResource: "versions-global",
          withExtension: "plist")!)

  public static let intraBuildNumberDictionary: StageBuildDictionaryProtocol! =
    Stage.dictionary(
      fromPlistAtURL:
        Bundle(for: IntraVersionTests.self).url(
          forResource: "versions-intra",
          withExtension: "plist")!)

  public let infoDictionary: [String: Any]?

  public init(version: Any?, build: Any?) {
    var infoDictionary = [String: Any]()

    if let version = version {
      infoDictionary[Version.InfoDictionaryKeys.version] = version
    }

    if let build = build {
      infoDictionary[Version.InfoDictionaryKeys.build] = build
    }

    self.infoDictionary = infoDictionary.count > 0 ? infoDictionary : nil
  }
}
