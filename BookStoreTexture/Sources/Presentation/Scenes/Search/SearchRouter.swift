//
//  SearchRouter.swift
//  BookStoreTexture
//
//  Created by Elon Parkon 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import UIKit

import Pure

protocol SearchRoutingLogic: AnyObject {

}

protocol SearchDataPassing: AnyObject {
  var dataStore: SearchDataStore? { get set }
}

/// @mockable
protocol SearchRouting: SearchRoutingLogic, SearchDataPassing {

}

final class SearchRouter: SearchRouting, FactoryModule {

  // MARK: - DI

  struct Dependency {

  }

  // MARK: - Properties

  weak var viewController: SearchViewController?
  var dataStore: SearchDataStore?

  private let dependency: Dependency

  // MARK: - Initializing

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
  }

  deinit {
    print("deinit: SearchRouter")
  }
}


// MARK: - Routing Logic

extension SearchRouter {

}