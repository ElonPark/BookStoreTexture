//
//  SearchPresenterTests.swift
//  BookStoreTextureTests
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import XCTest

@testable import BookStoreTexture
import Nimble

final class SearchPresenterTests: XCTestCase {

  // MARK: - Properties

  var presenter: SearchPresenter!
  var display: SearchDisplayLogicMock!

  override func setUp() {
    self.presenter = SearchPresenter()
    self.display = SearchDisplayLogicMock()
    self.presenter.viewController = self.display
  }
}


// MARK: - TODO TestName (BDD)

extension SearchPresenterTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}