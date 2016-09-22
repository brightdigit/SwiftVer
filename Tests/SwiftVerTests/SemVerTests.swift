//
//  SemVerTests.swift
//  SwiftVer
//
//  Created by Leo Dion on 9/21/16.
//  Copyright © 2016 BrightDigit, LLC. All rights reserved.
//

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
  
  func testGoodSemVerWithPatch () {
    let versionString = "1.2.3"
    let semver = SemVer(versionString: versionString)
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertEqual(semver?.patch, 3)
    XCTAssertEqual(versionString, semver?.description)
  }
  
  func testGoodSemVerWithNoPatch () {
    let versionString = "1.2"
    let semver = SemVer(versionString: versionString)
    XCTAssertEqual(semver?.major, 1)
    XCTAssertEqual(semver?.minor, 2)
    XCTAssertNil(semver?.patch)
    XCTAssertEqual(versionString, semver?.description)
  }
  
  func testBadSemVerString () {
    let versionString = "1.x.3"
    let semver = SemVer(versionString: versionString)
    XCTAssertNil(semver)
    XCTAssertNil(semver?.description)
  }
  
  func testBadSemVerValues () {
    let versionString = "dsfasdf"
    let semver = SemVer(versionString: versionString)
    XCTAssertNil(semver)
    XCTAssertNil(semver?.description)
  }
  
}
