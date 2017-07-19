import XCTest
@testable import SwiftVer

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
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

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
    XCTAssertEqual(version?.versionControl?.FULLHASH, versionControlInfo.FULLHASH)
    XCTAssertEqual(version?.versionControl?.SHORTHASH, versionControlInfo.SHORTHASH)
    XCTAssertEqual(version?.versionControl?.MODIFIED, versionControlInfo.MODIFIED)
  }

  func testMissingBundleVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: nil, build: 4)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingInvalidVersion() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "dfasdfs", build: 4)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testMissingBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: nil)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  func testInvalidBundleBuild() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    let bundle = MockBundle(version: "1.2.3", build: "asdfdsaf")
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)

    XCTAssertNil(version)
  }

  public func testdescription() {

    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)
    XCTAssertEqual(version?.description, version?.shortDescription)
  }

  public func testStageBuildNumber() {

    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)
    XCTAssertEqual(version?.stageBuildNumber, 3)
  }

  public func testSemverBuildNumber() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)
    XCTAssertEqual(version?.semverBuildNumber, 8)
  }

  public func testStage() {
    let bundle = MockBundle(version: "1.0.0", build: 8)
    let version = Version(bundle: bundle, dictionary: MockBundle.intraBuildNumberDictionary, buildNumberCumulative: false, versionControl: versionControlInfo)
    XCTAssertEqual(version?.stage, .beta)
  }

  //  public func testfullDescription() {
  //    let suffix = self.suffix
  //    let suffixString = Version.suffixFormatter.string(for: suffix)!.components(separatedBy: ".")[1]
  //    return "\(semver).\(suffixString)"
  //  }
  //
  //  public func testsuffix() {
  //    return (Double(semverMiniumBuild) +
  //      (Double(versionControl?.TICK ?? 0) + extra / 1000.0)
  //      / 10000.0) / 100.0
  //  }
  //
  //  public func testextra() {
  //    if let extraString = self.versionControl?.EXTRA {
  //      return Double(extraString) ?? 0
  //    } else {
  //      return 0
  //    }
  //  }
  //
  //  public func testshortDescription() {
  //    let stage: Stage
  //    let minimumBuild: UInt8
  //    if let stagebuild = self.dictionary.stage(withBuildForVersion: self) {
  //      stage = stagebuild.stage
  //      minimumBuild = stagebuild.minimum - 1
  //    } else {
  //      stage = .production
  //      minimumBuild = 0
  //    }
  //    switch stage {
  //    case .production:
  //      return "\(semver) (\(String(format: "%04X", build)))"
  //    default:
  //      return "\(semver)-\(stage)\(build - minimumBuild)"
  //    }
  //  }
}
