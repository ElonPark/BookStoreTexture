//
//  __SCENE_NAME__Interactor.swift
//  __TARGET_PROJECT_NAME__
//
//  Created by __COPYRIGHT__ on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import Foundation

import Pure

protocol __SCENE_NAME__BusinessLogic: AnyObject {

// clean-swift-scaffold-generate-business-interface (do-not-remove-comments)
}

protocol __SCENE_NAME__DataStore: AnyObject {

}

final class __SCENE_NAME__Interactor: __SCENE_NAME__DataStore, FactoryModule {

  // MARK: - DI

  struct Dependency {

  }

  // MARK: - Properties

  var presenter: __SCENE_NAME__PresentationLogic?

  private let dependency: Dependency

  // MARK: - Initializing

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
  }

  deinit {
    print("deinit: __SCENE_NAME__Interactor")
  }
}

// MARK: - Business Logic

extension __SCENE_NAME__Interactor: __SCENE_NAME__BusinessLogic {

// clean-swift-scaffold-generate-business-implementation (do-not-remove-comments)
}