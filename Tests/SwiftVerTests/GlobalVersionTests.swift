@testable import SwiftVer
import XCTest

class GlobalVersionTests: XCTestCase {
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
    let version = Version(
      bundle: bundle,
      dictionary: MockBundle.globalBuildNumberDictionary,
      versionControl: versionControlInfo
    )

    XCTAssertEqual(version?.semver.major, 1)
    XCTAssertEqual(version?.semver.minor, 2)
    XCTAssertEqual(version?.semver.patch, 3)
    XCTAssertEqual(version?.build, 4)

    XCTAssertEqual(version?.versionControl?.type, versionControlInfo.type)
    XCTAssertEqual(version?.versionControl?.baseName, versionControlInfo.baseName)
    XCTAssertEqual(version?.versionControl?.uuid, versionControlInfo.uuid)
    XCTAssertEqual(version?.versionControl?.number, versionControlInfo.number)
    XCTAssertEqual(version?.versionControl?.date, versionControlInfo.date)
    XCTAssertEqual(version?.versionControl?.branch, versionControlInfo.branch)
    XCTAssertEqual(version?.versionControl?.tag, versionControlInfo.tag)
    XCTAssertEqual(version?.versionControl?.tick, versionControlInfo.tick)
    XCTAssertEqual(version?.versionControl?.extra, versionControlInfo.extra)
    XCTAssertEqual(version?.versionControl?.hash, versionControlInfo.hash)

    XCTAssertEqual(version?.versionControl?.isWorkingCopyModified, versionControlInfo.isWorkingCopyModified)
  }

  func testMissingBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: nil, build: 4)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingInvalidVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "dfasdfs", build: 4)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: nil)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testInvalidBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: "asdfdsaf")
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  public func testdescription() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.description, version?.shortDescription)
  }

  public func testStageBuildNumber() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.stageBuildNumber, 4)
  }

  public func testSemverBuildNumber() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.semverBuildNumber, 9)
  }

  public func testStage() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.stage, .beta)
  }

  public func testFullDescription() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual((try? version?.fullDescription(withLocale: Locale(identifier: "en_US")))!, "1.1.0.0900250000")
    XCTAssertEqual((try? version?.fullDescription(withLocale: Locale(identifier: "nl_NL")))!, "1.1.0.0900250000")
  }

  public func testSubSemVerValue() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.subSemVerValue, 0.0900250000)
  }

  public func testShortDescription() {
    let bundle = MockBundle(version: "1.1.0", build: 26)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.shortDescription, "1.1.0-beta4")
  }

  public func testShortDescriptionProduction() {
    let bundle = MockBundle(version: "1.1.0", build: 32)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.globalBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.shortDescription, "1.1.0 (0020)")
  }

  public func testInitBuildNumber() {
    let version = Version(cumulativeBuildNumber: 26, dictionary: MockBundle.globalBuildNumberDictionary)

    XCTAssertEqual(version.shortDescription, "1.1.0-beta4")
  }

  public func testFromBundle() {
    let bundle = MockBundle(version: "1.1.0", build: 32)
    let version = Version.from(bundle: bundle,
                               dictionary: MockBundle.globalBuildNumberDictionary,
                               withVersionControlInfoWithJsonResource: "versions-global")

    XCTAssertEqual(version?.shortDescription, "1.1.0 (0020)")
  }
}
