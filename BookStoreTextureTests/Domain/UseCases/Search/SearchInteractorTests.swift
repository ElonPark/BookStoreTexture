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
import RxSwift

final class SearchInteractorTests: XCTestCase {

  // MARK: - Properties

  var repository: BookStoreRepositoryMock!
  var presenter: SearchPresentationLogicMock!
  var interactor: SearchInteractor!

  override func setUp() {
    self.repository = BookStoreRepositoryMock()
    self.presenter = SearchPresentationLogicMock()
    self.interactor = self.createInteractor()
  }

  private func createInteractor() -> SearchInteractor {
    let interactor = SearchInteractor.Factory(
      dependency: SearchInteractor.Dependency(
        repository: self.repository
      )
    ).create()
    interactor.presenter = self.presenter
    return interactor
  }
}


// MARK: - Search Request

extension SearchInteractorTests {
  func test_검색을_요청하면_결과를_반환해요() {
    // given
    let request = SearchModel.Search.Request(query: "swift")
    let searchResultStub = SearchResult(
      error: "0",
      total: "1",
      page: "1",
      books: [
        SearchResult.Book(
          title: "test",
          subtitle: "test",
          isbn13: "12345",
          price: "99.99",
          image: nil,
          url: nil,
          pdf: nil
        )
      ]
    )

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.just(searchResultStub)
    }

    var presenterResponse: SearchResponse?
    var presenterError: Error?
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        presenterResponse = result

      case let .error(error):
        presenterError = error
      }
    }

    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    expect(self.repository.requestSearchResultCallCount) == 1
    expect(self.presenter.presentSearchCallCount) == 1
    expect(presenterResponse?.books.count) == 1
    expect(presenterResponse?.books.first?.isbn13) == "12345"
    expect(presenterError).to(beNil())
  }

  func test_검색어가_공백이라면_검색을_요청하지_않아요() {
    // given
    let request = SearchModel.Search.Request(query: " ")
    let searchResultStub = SearchResult(
      error: "0",
      total: "1",
      page: "1",
      books: [
        SearchResult.Book(
          title: "test",
          subtitle: "test",
          isbn13: "12345",
          price: "99.99",
          image: nil,
          url: nil,
          pdf: nil
        )
      ]
    )

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.just(searchResultStub)
    }

    var presenterResponse: SearchResponse?
    var presenterError: Error?
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        presenterResponse = result

      case let .error(error):
        presenterError = error
      }
    }

    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultCallCount) == 0
    expect(self.presenter.presentSearchCallCount) == 0
    expect(presenterResponse).to(beNil())
    expect(presenterError).to(beNil())
  }

  func test_검색어가_개행이라면_검색을_요청하지_않아요() {
    // given
    let request = SearchModel.Search.Request(query: "\n")
    let searchResultStub = SearchResult(
      error: "0",
      total: "1",
      page: "1",
      books: [
        SearchResult.Book(
          title: "test",
          subtitle: "test",
          isbn13: "12345",
          price: "99.99",
          image: nil,
          url: nil,
          pdf: nil
        )
      ]
    )

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.just(searchResultStub)
    }

    var presenterResponse: SearchResponse?
    var presenterError: Error?
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        presenterResponse = result

      case let .error(error):
        presenterError = error
      }
    }

    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultCallCount) == 0
    expect(self.presenter.presentSearchCallCount) == 0
    expect(presenterResponse).to(beNil())
    expect(presenterError).to(beNil())
  }

  func test_검색결과_응답이_오류응답이라면_오류를_반환해요() {
    // given
    let request = SearchModel.Search.Request(query: "swift")
    let searchResultStub = SearchResult(
      error: "[search] Invalid request",
      total: nil,
      page: nil,
      books: nil
    )

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.just(searchResultStub)
    }

    var presenterResponse: SearchResponse?
    var presenterError: Error?
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        presenterResponse = result

      case let .error(error):
        presenterError = error
      }
    }

    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    expect(self.repository.requestSearchResultCallCount) == 1
    expect(self.presenter.presentSearchCallCount) == 1
    expect(presenterResponse).to(beNil())
    expect(presenterError as? SearchError) == .responseError("[search] Invalid request")
  }

  func test_검색요청이_실패하면_오류를_반환해요() {
    // given
    let request = SearchModel.Search.Request(query: "swift")
    let error = URLError(.badServerResponse)

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.error(error)
    }

    var presenterResponse: SearchResponse?
    var presenterError: Error?
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        presenterResponse = result

      case let .error(error):
        presenterError = error
      }
    }

    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    expect(self.repository.requestSearchResultCallCount) == 1
    expect(self.presenter.presentSearchCallCount) == 1
    expect(presenterResponse).to(beNil())
    expect((presenterError as? URLError)?.code) == .badServerResponse
  }
}


// MARK: - Factory Dummy

extension Factory where Module == SearchInteractor {
  static func dummy() -> Factory {
    return SearchInteractor.Factory(
      dependency: SearchInteractor.Dependency(
        repository: BookStoreRepositoryMock()
      )
    )
  }
}
