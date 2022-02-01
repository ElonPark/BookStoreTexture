//
//  SearchViewControllerTests.swift
//  BookStoreTextureTests
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import XCTest

@testable import BookStoreTexture
import Nimble
import Pure

final class SearchViewControllerTests: XCTestCase {

  // MARK: - Properties

  var interactor: SearchBusinessLogicMock!
  var dataStore: SearchDataStoreMock!
  var router: SearchRoutingMock!
  var viewController: SearchViewController!

  override func setUp() {
    self.interactor = SearchBusinessLogicMock()
    self.router = SearchRoutingMock()
    self.viewController = self.createViewController()
  }

  private func createViewController() -> SearchViewController {
    let viewController = SearchViewController.Factory(
      dependency: SearchViewController.Dependency(
        interactorFactory: .dummy(),
        routerFactory: .dummy()
      )
    ).create()
    viewController.interactor = self.interactor
    viewController.router = self.router

    return viewController
  }
}


// MARK: - TODO TestName (BDD)

extension SearchViewControllerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}


// MARK: - Factory Dummy

extension Factory where Module == SearchViewController {
  static func dummy() -> Factory {
    return SearchViewController.Factory(
      dependency: SearchViewController.Dependency(
        interactorFactory: .dummy(),
        routerFactory: .dummy()
      )
    )
  }
}

extension Factory where Module == SearchRouter {
  static func dummy() -> Factory {
    return SearchRouter.Factory(
      dependency: SearchRouter.Dependency()
    )
  }
}
