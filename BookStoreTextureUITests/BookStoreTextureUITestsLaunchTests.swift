//
//  BookStoreTextureUITestsLaunchTests.swift
//  BookStoreTextureUITests
//
//  Created by Elon on 2021/12/11.
//

import XCTest

class BookStoreTextureUITestsLaunchTests: XCTestCase {

  override class var runsForEachTargetApplicationUIConfiguration: Bool {
    true
  }

  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  func testLaunch() throws {
    let app = XCUIApplication()
    app.launch()
  }
}
