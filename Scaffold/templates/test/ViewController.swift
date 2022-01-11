//
//  __SCENE_NAME__ViewControllerTests.swift
//  __TARGET_PROJECT_NAME__Tests
//
//  Created by __COPYRIGHT__ on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import XCTest

@testable import __TARGET_PROJECT_NAME__
import Nimble
import Pure

final class __SCENE_NAME__ViewControllerTests: XCTestCase {

  // MARK: - Test Double Objects

  final class __SCENE_NAME__InteractorSpy: __SCENE_NAME__BusinessLogic {

// clean-swift-scaffold-generate-business-spy (do-not-remove-comments)
  }

  final class __SCENE_NAME__RouterSpy: __SCENE_NAME__RoutingLogic, __SCENE_NAME__DataPassing {

    var dataStore: __SCENE_NAME__DataStore?

  }

  // MARK: - Properties

  var interactor: __SCENE_NAME__InteractorSpy!
  var router: __SCENE_NAME__RouterSpy!
  var viewController: __SCENE_NAME__ViewController!

  override func setUp() {
    self.interactor = __SCENE_NAME__InteractorSpy()
    self.router = __SCENE_NAME__RouterSpy()
    self.viewController = self.createViewController()
  }

  private func createViewController() -> __SCENE_NAME__ViewController {
    let viewController = __SCENE_NAME__ViewController.Factory(
      dependency: __SCENE_NAME__ViewController.Dependency(
        interactorFactory: .dummy(),
        routerFactory: .dummy()
      )
    ).create()
    viewController.interactor = self.interactor
    viewController.router = self.router
    return viewController
  }
}

// MARK: - TODO TestName (BDD)

extension __SCENE_NAME__ViewControllerTests {

  func test_doSomething() {
    // given

    // when

    // then
  }
}

// MARK: - Factory Dummy

extension Factory where Module == __SCENE_NAME__ViewController {
  static func dummy() -> Factory {
    return __SCENE_NAME__ViewController.Factory(
      dependency: __SCENE_NAME__ViewController.Dependency(
        interactorFactory: .dummy(),
        routerFactory: .dummy()
      )
    )
  }
}

extension Factory where Module == __SCENE_NAME__Router {
  static func dummy() -> Factory {
    return __SCENE_NAME__Router.Factory(
      dependency: __SCENE_NAME__Router.Dependency()
    )
  }
}
