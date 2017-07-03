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

  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    measure {
      // Put the code you want to measure the time of here.
    }
  }
}
