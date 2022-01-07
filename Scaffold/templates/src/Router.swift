//
//  __SCENE_NAME__Router.swift
//  __TARGET_PROJECT_NAME__
//
//  Created by clean-swift-scaffold on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import UIKit

protocol __SCENE_NAME__RoutingLogic: AnyObject {

}

protocol __SCENE_NAME__DataPassing: AnyObject {

  var dataStore: __SCENE_NAME__DataStore? { get set }
}

final class __SCENE_NAME__Router: __SCENE_NAME__DataPassing {

  // MARK: - DI

  struct Dependency {

  }

  // MARK: - Properties

  weak var viewController: __SCENE_NAME__ViewController?
  var dataStore: __SCENE_NAME__DataStore?

  private let dependency: Dependency

  // MARK: - Initializing

  init(dependency: Dependency, payload: Payload) {
    self.dependency = dependency
  }

  deinit {
    print("deinit: __SCENE_NAME__Router")
  }
}

// MARK: - Routing Logic

extension __SCENE_NAME__Router: __SCENE_NAME__RoutingLogic {

}