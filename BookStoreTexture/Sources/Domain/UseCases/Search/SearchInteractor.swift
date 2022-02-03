//
//  SearchInteractor.swift
//  BookStoreTexture
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import Foundation

import Pure
import RxSwift
import RxRelay
import Then

/// @mockable
protocol SearchBusinessLogic: AnyObject {
  func search(request: SearchModel.Search.Request)
  func loadMore(request: SearchModel.LoadMore.Request)
}

/// @mockable
protocol SearchDataStore: AnyObject {

}

final class SearchInteractor: SearchDataStore, FactoryModule {

  private struct State: Then, Equatable {
    var isLoading: Bool = false

    var total: Int = 0
    var currentPage: Int = 0
    var searchQuery: String?
    var books = [SearchResponse.Book]()
  }

  // MARK: - DI

  struct Dependency {
    let repository: BookStoreRepository
  }

  // MARK: - Properties

  var presenter: SearchPresentationLogic?

  private let dependency: Dependency
  private let mapper = SearchModelMapper()

  private let currentState = BehaviorRelay(value: State())
  private var state: State {
    get { self.currentState.value }
    set { self.currentState.accept(newValue) }
  }

  private let serialDisposable = SerialDisposable()

  // MARK: - Initializing

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
  }

  deinit {
    serialDisposable.dispose()
    print("deinit: SearchInteractor")
  }
}


// MARK: - Business Logic

extension SearchInteractor: SearchBusinessLogic {
  func search(request: SearchModel.Search.Request) {
    let trimmedQuery = self.trimmedQuery(request.query)
    guard !trimmedQuery.isEmpty else { return }

    let pathAllowedQuery = self.pathAllowedQuery(trimmedQuery)
    guard let query = pathAllowedQuery else { return }

    self.updateLoadingState(isLoading: true)
    self.dependency.repository.requestSearchResult(byQuery: query)
      .map(self.mapper.mapToSearchResponse())
      .subscribe(with: self, onSuccess: { `self`, searchResponse in
        self.updateLoadingState(isLoading: false)
        self.setState(from: searchResponse, with: query)
        self.presenter?.presentSearch(response: .result(searchResponse))

      }, onFailure: { `self`, error in
        self.updateLoadingState(isLoading: false)
        self.presenter?.presentSearch(response: .error(error))
      })
      .disposed(by: self.serialDisposable)
  }

  private func trimmedQuery(_ query: String) -> String {
    return query.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  private func pathAllowedQuery(_ query: String) -> String? {
    return query.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
  }

  private func updateLoadingState(isLoading: Bool) {
    self.state = self.state.with {
      $0.isLoading = isLoading
    }
  }

  private func setState(from searchResponse: SearchResponse, with searchQuery: String) {
    self.state = self.state.with {
      $0.searchQuery = searchQuery
      $0.total = searchResponse.total
      $0.currentPage = searchResponse.page
      $0.books = searchResponse.books
    }
  }

  func loadMore(request: SearchModel.LoadMore.Request) {

  }
}
