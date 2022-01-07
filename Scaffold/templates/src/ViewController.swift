//
//  __SCENE_NAME__ViewController.swift
//  __TARGET_PROJECT_NAME__
//
//  Created by clean-swift-scaffold on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import UIKit

import Pure

protocol __SCENE_NAME__DisplayLogic: AnyObject {

// clean-swift-scaffold-generate-display-interface (do-not-remove-comments)
}

final class __SCENE_NAME__ViewController: UIVIewController {

  // MARK: DI

  struct Dependency {
    let interactorFactory: __SCENE_NAME__Interactor.Factory
    let routerFactory: __SCENE_NAME__Router.Factory
  }

  // MARK: - Properties

  var router: (__SCENE_NAME__RoutingLogic & __SCENE_NAME__DataPassing)?
  var interactor: __SCENE_NAME__BusinessLogic?

  private let dependency: Dependency

  // MARK: - Initializing

 init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
    super.init()
    self.configure()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Configuring

  private func configure() {
    let viewController = self
    let interactor = __SCENE_NAME__Interactor()
    let presenter = __SCENE_NAME__Presenter()
    let router = __SCENE_NAME__Router()

    interactor.presenter = presenter

    presenter.view = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}

// MARK: - Display Logic

extension __SCENE_NAME__ViewController: __SCENE_NAME__DisplayLogic {

// clean-swift-scaffold-generate-display-implementation (do-not-remove-comments)
}