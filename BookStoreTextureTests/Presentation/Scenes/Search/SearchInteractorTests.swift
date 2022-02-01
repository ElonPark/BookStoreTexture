//
//  SearchInteractorTests.swift
//  BookStoreTextureTests
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import XCTest

@testable import BookStoreTexture
import Nimble
import Pure

final class SearchInteractorTests: XCTestCase {

  // MARK: - Properties

  var presenter: SearchPresentationLogicMock!
  var interactor: SearchInteractor!

  override func setUp() {
    self.presenter = SearchPresentationLogicMock()
    self.interactor = self.createInteractor()
  }

  private func createInteractor() -> SearchInteractor {
    let interactor = SearchInteractor.Factory(
      dependency: SearchInteractor.Dependency()
    ).create()
    interactor.presenter = self.presenter
    return interactor
  }
}


// MARK: - TODO TestName (BDD)

extension SearchInteractorTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}


// MARK: - Factory Dummy

extension Factory where Module == SearchInteractor {
  static func dummy() -> Factory {
    return SearchInteractor.Factory(
      dependency: SearchInteractor.Dependency()
    )
  }
}
