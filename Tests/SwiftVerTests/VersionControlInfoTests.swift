@testable import SwiftVer
import XCTest

let versionControlInfo = VersionControlInfo(
  type: VCS_TYPE,
  baseName: VCS_BASENAME,
  uuid: Hash(string: VCS_UUID!),
  number: VCS_NUM,
  date: VCS_DATE,
  branch: VCS_BRANCH,
  tag: VCS_TAG,
  tick: VCS_TICK,
  extra: VCS_EXTRA,
  hash: Hash(string: VCS_FULL_HASH)!,
  isWorkingCopyModified: VCS_WC_MODIFIED
)

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
    XCTAssertEqual(versionControlInfo.type.description.caseInsensitiveCompare(VCS_TYPE), .orderedSame)
    XCTAssertEqual(versionControlInfo.baseName, VCS_BASENAME)
    XCTAssertEqual(versionControlInfo.uuid?.description, VCS_UUID)
    XCTAssertEqual(versionControlInfo.number, VCS_NUM)
    XCTAssertEqual(versionControlInfo.date, DateFormatter.rfc3339DateFormatter.date(from: VCS_DATE))
    XCTAssertEqual(versionControlInfo.branch, VCS_BRANCH)
    XCTAssertEqual(versionControlInfo.tag, VCS_TAG)
    XCTAssertEqual(versionControlInfo.tick, VCS_TICK)
    XCTAssertEqual(versionControlInfo.extra, VCS_EXTRA)
    XCTAssertEqual(versionControlInfo.hash.description, VCS_FULL_HASH)
    XCTAssertEqual(versionControlInfo.isWorkingCopyModified, VCS_WC_MODIFIED)
  }

  func testInitBasedOn() {
    let versionControlInfoOther = VersionControlInfo(basedOn: versionControlInfo, tick: 200, extra: "200")
    XCTAssertEqual(versionControlInfoOther.type.description.caseInsensitiveCompare(VCS_TYPE), .orderedSame)
    XCTAssertEqual(versionControlInfoOther.baseName, VCS_BASENAME)
    XCTAssertEqual(versionControlInfoOther.uuid, nil)
    XCTAssertEqual(versionControlInfoOther.number, VCS_NUM)
    XCTAssertEqual(versionControlInfoOther.date, nil)
    XCTAssertEqual(versionControlInfoOther.branch, VCS_BRANCH)
    XCTAssertEqual(versionControlInfoOther.tag, nil)
    XCTAssertEqual(versionControlInfoOther.tick, 200)
    XCTAssertEqual(versionControlInfoOther.extra, "200")
    XCTAssertEqual(versionControlInfoOther.hash.description, VCS_FULL_HASH)
    XCTAssertEqual(versionControlInfoOther.isWorkingCopyModified, VCS_WC_MODIFIED)
  }

  func testInitJsonResource() {
    let versionControlInfoJsonOpt =
      VersionControlInfo(jsonResource: "autorevision",
                         fromBundle: Bundle(for: VersionControlInfoTests.self)) ?? VersionControlInfo(fromUrl: URL(fileURLWithPath: #file).deletingLastPathComponent().appendingPathComponent("autorevision").appendingPathExtension("json"))

    guard let versionControlInfoJson = versionControlInfoJsonOpt else {
      XCTFail()
      return
    }
    XCTAssertEqual(versionControlInfoJson.type.description.caseInsensitiveCompare("git"), .orderedSame)
    XCTAssertEqual(versionControlInfoJson.baseName, "swiftvertests")
    XCTAssertEqual(versionControlInfoJson.uuid?.description, "dba359e6621e2e2243d8eb2d42b6c07860976fd9")
    XCTAssertEqual(versionControlInfoJson.number, 425)
    XCTAssertEqual(versionControlInfoJson.date, DateFormatter.rfc3339DateFormatter.date(from: "2017-07-03T13:23:17Z"))
    XCTAssertEqual(versionControlInfoJson.branch, "feature/swiftver-v1.1.0")
    XCTAssertEqual(versionControlInfoJson.tag, "1.1.0-alpha3")
    XCTAssertEqual(versionControlInfoJson.tick, 7)
    XCTAssertEqual(versionControlInfoJson.extra, "33")
    XCTAssertEqual(versionControlInfoJson.hash.description, "a0ebb778b4cb62785a0f3cfa951c5137969b1aba")
    XCTAssertEqual(versionControlInfoJson.isWorkingCopyModified, true)
  }
}
