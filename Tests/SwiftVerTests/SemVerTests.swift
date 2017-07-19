import XCTest
@testable import SwiftVer

class SemVerTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testGoodSemVerWithPatch() {
    let versionString = "1.2.3"
    let semver = SemVer(versionString: versionString)
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertEqual(semver?.patch, 3)
    XCTAssertEqual(versionString, semver?.description)
  }

  func testGoodSemVerWithNoPatch() {
    let versionString = "1.2"
    let semver = SemVer(versionString: versionString)
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertNil(semver?.patch)
    XCTAssertEqual(versionString, semver?.description)
  }

  func testBadSemVerString() {
    let versionString = "1.x.3"
    let semver = SemVer(versionString: versionString)
    XCTAssertNil(semver)
    XCTAssertNil(semver?.description)
  }

  func testBadSemVerValues() {
    let versionString = "dsfasdf"
    let semver = SemVer(versionString: versionString)
    XCTAssertNil(semver)
    XCTAssertNil(semver?.description)
  }

  func testGoodSemVerMMPWithPatch() {
    let versionString = "1.2.3"
    let semver = SemVer(major: "1", minor: "2", patch: "3")
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertEqual(semver?.patch, 3)
    XCTAssertEqual(versionString, semver?.description)
  }

  func testGoodSemVerMMPWithNoPatch() {
    let versionString = "1.2"
    let semver = SemVer(major: "1", minor: "2")
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertNil(semver?.patch)
    XCTAssertEqual(versionString, semver?.description)
  }

  func testBadSemVerMMPString() {
    let semver = SemVer(major: "1", minor: "x", patch: "3")
    XCTAssertNil(semver)
    XCTAssertNil(semver?.description)
  }
}
