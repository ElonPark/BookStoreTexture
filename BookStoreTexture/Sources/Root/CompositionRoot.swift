//
//  CompositionRoot.swift
//  BookStoreTexture
//
//  Created by Elon on 2021/12/30.
//

import UIKit

struct AppDependency {
  let window: UIWindow
  let rootViewController: UIViewController
  let reachabilityManager: ReachabilityManageable
}

enum CompositionRoot {
  static func resolve() -> AppDependency {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let rootViewController = self.createRootViewController()
    let reachabilityManager = ReachabilityManager()

    return AppDependency(
      window: window,
      rootViewController: rootViewController,
      reachabilityManager: reachabilityManager
    )
  }

  private static func createRootViewController() -> UIViewController {
    let searchViewController = self.createSearchViewController()
    return BaseNavigationController(rootViewController: searchViewController)
  }

  private static func createSearchViewController() -> SearchViewController {
    return SearchViewController.Factory(
      dependency: SearchViewController.Dependency(
        interactorFactory: SearchInteractor.Factory(
          dependency: SearchInteractor.Dependency()
        ),
        routerFactory: SearchRouter.Factory(
          dependency: SearchRouter.Dependency()
        )
      )
    ).create()
  }
}
