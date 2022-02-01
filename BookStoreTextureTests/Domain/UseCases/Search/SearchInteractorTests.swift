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
    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    self.presenter.presentSearchHandler = { response in
      switch response {
      case let .result(result):
        expect(result.books.count) == 1
        expect(result.books.first?.isbn13) == "12345"

      case .error:
        fail("검색 성공시에는 오류를 반환할 수 없어요.")
      }
    }
    expect(self.presenter.presentSearchCallCount) == 1
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
    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    self.presenter.presentSearchHandler = { response in
      switch response {
      case .result:
        fail("검색 실패시에는 결과를 반환할 수 없어요.")

      case let .error(error):
        expect((error as? SearchError)) == .responseError("test")
      }
    }
    expect(self.presenter.presentSearchCallCount) == 1
  }

  func test_검색요청이_실패하면_오류를_반환해요() {
    // given
    let request = SearchModel.Search.Request(query: "swift")
    let error = URLError(.badServerResponse)

    // when
    self.repository.requestSearchResultHandler = { _ in
      Single.error(error)
    }
    self.interactor.search(request: request)

    // then
    expect(self.repository.requestSearchResultByQueryCallCount) == 0
    self.presenter.presentSearchHandler = { response in
      switch response {
      case .result:
        fail("검색 실패시에는 결과를 반환할 수 없어요.")

      case let .error(error):
        expect((error as? URLError)?.code) == .badServerResponse
      }
    }
    expect(self.presenter.presentSearchCallCount) == 1
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
