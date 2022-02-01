//
//  __SCENE_NAME__PresenterTests.swift
//  __TARGET_PROJECT_NAME__Tests
//
//  Created by __COPYRIGHT__ on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import XCTest

@testable import __TARGET_PROJECT_NAME__
import Nimble

final class __SCENE_NAME__PresenterTests: XCTestCase {

  // MARK: - Properties

  var presenter: __SCENE_NAME__Presenter!
  var display: __SCENE_NAME__DisplayLogicMock!

  override func setUp() {
    self.presenter = __SCENE_NAME__Presenter()
    self.display = __SCENE_NAME__DisplayLogicMock()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension __SCENE_NAME__PresenterTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}