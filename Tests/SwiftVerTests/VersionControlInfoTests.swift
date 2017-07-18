import XCTest
@testable import SwiftVer

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

class VersionControlInfoTests: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testInit() {
    XCTAssertEqual(versionControlInfo.TYPE.description.caseInsensitiveCompare(VCS_TYPE), .orderedSame)
    XCTAssertEqual(versionControlInfo.BASENAME, VCS_BASENAME)
    XCTAssertEqual(versionControlInfo.UUID, VCS_UUID)
    XCTAssertEqual(versionControlInfo.NUM, VCS_NUM)
    XCTAssertEqual(versionControlInfo.DATE, RFC3339DateFormatter.instance.date(from: VCS_DATE))
    XCTAssertEqual(versionControlInfo.BRANCH, VCS_BRANCH)
    XCTAssertEqual(versionControlInfo.TAG, VCS_TAG)
    XCTAssertEqual(versionControlInfo.TICK, VCS_TICK)
    XCTAssertEqual(versionControlInfo.EXTRA, VCS_EXTRA)
    XCTAssertEqual(versionControlInfo.FULLHASH, VCS_FULL_HASH)
    XCTAssertEqual(versionControlInfo.SHORTHASH, VCS_SHORT_HASH)
    XCTAssertEqual(versionControlInfo.MODIFIED, VCS_WC_MODIFIED)
  }

  func testInitBasedOn() {
    let versionControlInfoOther = VersionControlInfo(basedOn: versionControlInfo, TICK: 200, EXTRA: "200")
    XCTAssertEqual(versionControlInfoOther.TYPE.description.caseInsensitiveCompare(VCS_TYPE), .orderedSame)
    XCTAssertEqual(versionControlInfoOther.BASENAME, VCS_BASENAME)
    XCTAssertEqual(versionControlInfoOther.UUID, nil)
    XCTAssertEqual(versionControlInfoOther.NUM, VCS_NUM)
    XCTAssertEqual(versionControlInfoOther.DATE, nil)
    XCTAssertEqual(versionControlInfoOther.BRANCH, VCS_BRANCH)
    XCTAssertEqual(versionControlInfoOther.TAG, nil)
    XCTAssertEqual(versionControlInfoOther.TICK, 200)
    XCTAssertEqual(versionControlInfoOther.EXTRA, "200")
    XCTAssertEqual(versionControlInfoOther.FULLHASH, VCS_FULL_HASH)
    XCTAssertEqual(versionControlInfoOther.SHORTHASH, VCS_SHORT_HASH)
    XCTAssertEqual(versionControlInfoOther.MODIFIED, VCS_WC_MODIFIED)
  }

  func testInitJsonResource() {
    print(Bundle(for: VersionControlInfoTests).paths(forResourcesOfType: "json", inDirectory: nil, forLocalization: nil))
    let versionControlInfoJson = VersionControlInfo(jsonResource: "autorevision", fromBundle: Bundle(for: VersionControlInfoTests))!
    XCTAssertEqual(versionControlInfoJson.TYPE.description.caseInsensitiveCompare("git"), .orderedSame)
    XCTAssertEqual(versionControlInfoJson.BASENAME, "swiftvertests")
    XCTAssertEqual(versionControlInfoJson.UUID, "dba359e6621e2e2243d8eb2d42b6c07860976fd9")
    XCTAssertEqual(versionControlInfoJson.NUM, 425)
    XCTAssertEqual(versionControlInfoJson.DATE, RFC3339DateFormatter.instance.date(from: "2017-07-03T13:23:17Z"))
    XCTAssertEqual(versionControlInfoJson.BRANCH, "feature/swiftver-v1.1.0")
    XCTAssertEqual(versionControlInfoJson.TAG, "1.1.0-alpha3")
    XCTAssertEqual(versionControlInfoJson.TICK, 7)
    XCTAssertEqual(versionControlInfoJson.EXTRA, "33")
    XCTAssertEqual(versionControlInfoJson.FULLHASH, "a0ebb778b4cb62785a0f3cfa951c5137969b1aba")
    XCTAssertEqual(versionControlInfoJson.SHORTHASH, "a0ebb77")
    XCTAssertEqual(versionControlInfoJson.MODIFIED, true)
  }
}
