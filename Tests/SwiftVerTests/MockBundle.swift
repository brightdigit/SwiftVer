import Foundation
@testable import SwiftVer

struct MockBundle: InfoDictionaryContainerProtocol, ResourceContainerProtocol {
  public static let globalBuildNumberDictionary: StageBuildDictionaryProtocol =
    Stage.dictionary(
      fromPlistAtURL:
      Bundle(for: GlobalVersionTests.self).url(
        forResource: "versions-global",
        withExtension: "plist"
      )!
    )!

  public static let intraBuildNumberDictionary: StageBuildDictionaryProtocol =
    Stage.dictionary(
      fromPlistAtURL:
      Bundle(for: IntraVersionTests.self).url(
        forResource: "versions-intra",
        withExtension: "plist"
      )!
    )!

  public let infoDictionary: [String: Any]?

  public init(version: Any?, build: Any?) {
    var infoDictionary = [String: Any]()

    if let version = version {
      infoDictionary["CFBundleShortVersionString"] = version
    }

    if let build = build {
      infoDictionary["CFBundleVersion"] = build
    }

    self.infoDictionary = infoDictionary.count > 0 ? infoDictionary : nil
  }

  public func url(forResource name: String?, withExtension ext: String?, subdirectory subpath: String?) -> URL? {
    return Bundle(for: IntraVersionTests.self).url(
      forResource: name,
      withExtension: ext,
      subdirectory: subpath
    )
  }
}
