import XCTest
@testable import SwiftVer

struct MockBundle: VersionContainerProtocol {
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

let versionControlInfo = VersionControlInfo(
  TYPE: VCS_TYPE,
  BASENAME: VCS_BASENAME,
  UUID: VCS_UUID,
  NUM: VCS_NUM,
  DATE: VCS_DATE,
  BRANCH: VCS_BRANCH,
  TAG: VCS_TAG,
  TICK: VCS_TICK,
  EXTRA: VCS_EXTRA,
  FULLHASH: VCS_FULL_HASH,
  SHORTHASH: VCS_SHORT_HASH,
  MODIFIED: VCS_WC_MODIFIED)

class VersionTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testGoodBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let bundle = MockBundle(version: "1.2.3", build: 4)
    let version = Version(bundle: bundle, versionControl: versionControlInfo)

    XCTAssertEqual(version?.semver.major, 1)
    XCTAssertEqual(version?.semver.minor, 2)
    XCTAssertEqual(version?.semver.patch, 3)
    XCTAssertEqual(version?.build, 4)

    XCTAssertEqual(version?.versionControl?.TYPE, versionControlInfo.TYPE)
    XCTAssertEqual(version?.versionControl?.BASENAME, versionControlInfo.BASENAME)
    XCTAssertEqual(version?.versionControl?.UUID, versionControlInfo.UUID)
    XCTAssertEqual(version?.versionControl?.NUM, versionControlInfo.NUM)
    XCTAssertEqual(version?.versionControl?.DATE, versionControlInfo.DATE)
    XCTAssertEqual(version?.versionControl?.BRANCH, versionControlInfo.BRANCH)
    XCTAssertEqual(version?.versionControl?.TAG, versionControlInfo.TAG)
    XCTAssertEqual(version?.versionControl?.TICK, versionControlInfo.TICK)
    XCTAssertEqual(version?.versionControl?.EXTRA, versionControlInfo.EXTRA)
    XCTAssertEqual(version?.versionControl?.FULL_HASH, versionControlInfo.FULL_HASH)
    XCTAssertEqual(version?.versionControl?.SHORT_HASH, versionControlInfo.SHORT_HASH)
    XCTAssertEqual(version?.versionControl?.WC_MODIFIED, versionControlInfo.WC_MODIFIED)
  }

  func testMissingBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: nil, build: 4)
    let version = Version(bundle: bundle, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingInvalidVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "dfasdfs", build: 4)
    let version = Version(bundle: bundle, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: nil)
    let version = Version(bundle: bundle, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testInvalidBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: "asdfdsaf")
    let version = Version(bundle: bundle, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }
}
