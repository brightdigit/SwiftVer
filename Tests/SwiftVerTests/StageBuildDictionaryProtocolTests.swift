@testable import SwiftVer
import XCTest

class StageBuildDictionaryProtocolTests: XCTestCase {
  struct MockStageBuildDictionary: StageBuildDictionaryProtocol {

    public let stage: Stage = Stage.beta
    public let minimum: Int = 200

    func stage(withBuildForVersion _: Version) -> StageBuild? {
      return (stage: stage, minimum: minimum)
    }

    func minimumBuild(forSemVer semver: SemVer, atStage stage: Stage?) -> Int? {
      return (semvers.contains(semver) || stage != nil) ? Int(minimum) : nil
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
    let semver = SemVer(major: 1, minor: 1)
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumBuild(forSemVer: semver, atStage: .beta)
    XCTAssertEqual(minimum, Int(dictionary.minimum))
  }

  func testminimumStageBuildNumberNotFound() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: 1, minor: 1)
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumBuild(forSemVer: semver, atStage: .beta)
    XCTAssertEqual(minimum, Int(dictionary.minimum))
  }

  func testminimumSemVerBuildNumberNotNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: 1, minor: 0)
    let semverOther = SemVer(major: 1, minor: 0)
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumBuild(forSemVer: semverOther)
    XCTAssertEqual(minimum, Int(dictionary.minimum))
  }

  func testminimumSemVerBuildNumberNil() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let semver = SemVer(major: 1, minor: 1)
    let semverOther = SemVer(major: 1, minor: 0)
    let dictionary = MockStageBuildDictionary(semvers: [semver])
    let minimum = dictionary.minimumBuild(forSemVer: semverOther)
    XCTAssertEqual(minimum, nil)
  }

  func testEmpty() {
    XCTAssertEqual(Stage.emptyDictionary.semvers.count, 0)
  }
}
