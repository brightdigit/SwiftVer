import XCTest
@testable import SwiftVer

class StageBuildDictionaryProtocolTests: XCTestCase {
  struct MockStageBuildDictionary: StageBuildDictionaryProtocol {
    func minimumStageBuildNumber(forSemVer _: SemVer, atStage _: Stage) -> Int {
      return Int(minimum)
    }

    public let stage: Stage = Stage.beta
    public let minimum: UInt8 = 200

    func stage(withBuildForVersion _: Version) -> StageBuild? {
      return (stage: stage, minimum: minimum)
    }

    func minimumBuild(forSemVer semver: SemVer) -> UInt8? {
      return semvers.contains(semver) ? minimum : nil
    }

    public let semvers: [SemVer]
  }

  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testminimumStageBuildNumberNotNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 1))
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumStageBuildNumber(forSemVer: semver, atStage: .beta)
    XCTAssertEqual(minimum, Int(dictionary.minimum))
  }

  func testminimumStageBuildNumberNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 1))
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumStageBuildNumber(forSemVer: semver, atStage: .beta)
    XCTAssertEqual(minimum, Int(dictionary.minimum))
  }

  func testminimumSemVerBuildNumberNotNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 1))
    let semverOther = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 0))
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumSemVerBuildNumber(forSemVer: semverOther)
    XCTAssertEqual(minimum, 1)
  }

  func testminimumSemVerBuildNumberNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 1))
    let semverOther = SemVer(major: UInt8(truncatingBitPattern: 1), minor: UInt8(truncatingBitPattern: 0))
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumSemVerBuildNumber(forSemVer: semverOther)
    XCTAssertEqual(minimum, 1)
  }

  func testEmpty() {
    XCTAssertEqual(Stage.emptyDictionary.semvers.count, 0)
  }
}
