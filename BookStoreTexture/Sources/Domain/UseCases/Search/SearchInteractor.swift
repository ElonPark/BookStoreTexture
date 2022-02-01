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

/// @mockable
protocol SearchBusinessLogic: AnyObject {
  func search(request: SearchModel.Search.Request)
  func loadMore(request: SearchModel.LoadMore.Request)
}

/// @mockable
protocol SearchDataStore: AnyObject {

}

final class SearchInteractor: SearchDataStore, FactoryModule {

  // MARK: - DI

  struct Dependency {
    let repository: BookStoreRepository
  }

  // MARK: - Properties

  var presenter: SearchPresentationLogic?

  private let dependency: Dependency
  private let mapper = SearchModelMapper()

  let serialDisposable = SerialDisposable()

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
    self.dependency.repository.requestSearchResult(byQuery: request.query)
      .subscribe(with: self, onSuccess: { `self`, result in
        let response = self.mapper.mapToSearchResponse(result)
        self.presenter?.presentSearch(response: response)
      }, onFailure: { `self`, error in
        self.presenter?.presentSearch(response: .error(error))
      })
      .disposed(by: self.serialDisposable)
  }

  func loadMore(request: SearchModel.LoadMore.Request) {

  }
}
