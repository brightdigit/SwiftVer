@testable import SwiftVer
import XCTest

class HashTests: XCTestCase {
  private let hashStrings = [
    "a0ebb778b4cb62785a0f3cfa951c5137969b1aba": true,
    "a22b36ca8da1e3c82a8ccb01991152a9fef6bb91": true,
    "NC[P76p-qV8-VquU": false
  ]

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  public func testHashValid() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    for pair in hashStrings {
      let hash = Hash(string: pair.key)
      pair.value ? XCTAssertEqual(hash?.description, pair.key) : XCTAssertNil(hash)
    }
  }
}
