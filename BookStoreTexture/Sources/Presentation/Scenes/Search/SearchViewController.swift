//
//  SearchViewController.swift
//  BookStoreTexture
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import UIKit

import Pure

/// @mockable
protocol SearchDisplayLogic: AnyObject {
  func displaySearch(viewModel: SearchModel.Search.ViewModel)
  func displayLoadMore(viewModel: SearchModel.LoadMore.ViewModel)
}

final class SearchViewController: BaseASViewController, FactoryModule {

  // MARK: DI

  struct Dependency {
    let interactorFactory: SearchInteractor.Factory
    let routerFactory: SearchRouter.Factory
  }


  // MARK: - Properties

  var router: SearchRouting?
  var interactor: SearchBusinessLogic?

  private let dependency: Dependency


  // MARK: - Initializing

 init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    super.init()
   self.configure(dependency: dependency)
  }


  // MARK: - Configuring

  private func configure(dependency: Dependency) {
    let viewController = self
    let interactor = self.dependency.interactorFactory.create()
    let presenter = SearchPresenter()
    let router = self.dependency.routerFactory.create()

    interactor.presenter = presenter

    presenter.viewController = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}


// MARK: - Display Logic

extension SearchViewController: SearchDisplayLogic {
  func displaySearch(viewModel: SearchModel.Search.ViewModel) {

  }

  func displayLoadMore(viewModel: SearchModel.LoadMore.ViewModel) {

  }
}
