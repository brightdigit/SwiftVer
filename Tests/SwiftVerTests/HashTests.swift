import XCTest
@testable import SwiftVer

class HashTests: XCTestCase {
  private let hashStrings = ["a0ebb778b4cb62785a0f3cfa951c5137969b1aba", "a22b36ca8da1e3c82a8ccb01991152a9fef6bb91"]

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testHashValid() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    for string in hashStrings {
      let hash = Hash(string: string)
      XCTAssertEqual(hash.description, string)
    }
  }
}
