@testable import SwiftVer
import XCTest

class IntraVersionTests: XCTestCase {
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
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

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
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingInvalidVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "dfasdfs", build: 4)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: nil)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testInvalidBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: "asdfdsaf")
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  public func testdescription() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.description, version?.shortDescription)
  }

  public func testStageBuildNumber() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.stageBuildNumber, 3)
  }

  public func testSemverBuildNumber() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.semverBuildNumber, 7)
  }

  public func testStage() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual(version?.stage, .beta)
  }

  public func testFullDescription() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)
    XCTAssertEqual((try? version?.fullDescription(withLocale: Locale(identifier: "en_US")))!, "1.0.0.0700250000")
    XCTAssertEqual((try? version?.fullDescription(withLocale: Locale(identifier: "nl_NL")))!, "1.0.0.0700250000")
  }

  public func testSubSemVerValue() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.subSemVerValue, 0.0700250000)
  }

  public func testShortDescription() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.shortDescription, "1.0.0-beta3")
  }

  public func testShortDescriptionProduction() {
    let bundle = MockBundle(version: "1.0.0", build: 9)
    let version = Version(bundle: bundle,
                          dictionary: MockBundle.intraBuildNumberDictionary,
                          versionControl: versionControlInfo)

    XCTAssertEqual(version?.shortDescription, "1.0.0 (0009)")
  }

  public func testInitSemVer() {
    let version = Version(
      semver: SemVer(major: 1, minor: 0, patch: 0),
      build: 8,
      dictionary: MockBundle.intraBuildNumberDictionary
    )

    XCTAssertEqual(version.shortDescription, "1.0.0-beta3")
  }

  public func testFromBundle() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version.from(bundle: bundle,
                               dictionary: MockBundle.globalBuildNumberDictionary,
                               withVersionControlInfoWithJsonResource: "versions-intra")

    XCTAssertEqual(version?.shortDescription, "1.0.0-beta3")
  }
}
