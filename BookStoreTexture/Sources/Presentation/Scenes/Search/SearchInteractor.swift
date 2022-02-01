//
//  SearchInteractor.swift
//  BookStoreTexture
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import Foundation

import Pure

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

  }

  // MARK: - Properties

  var presenter: SearchPresentationLogic?

  private let dependency: Dependency

  // MARK: - Initializing

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
  }

  deinit {
    print("deinit: SearchInteractor")
  }
}


// MARK: - Business Logic

extension SearchInteractor: SearchBusinessLogic {

  func search(request: SearchModel.Search.Request) {

  }

  func loadMore(request: SearchModel.LoadMore.Request) {

  }
}