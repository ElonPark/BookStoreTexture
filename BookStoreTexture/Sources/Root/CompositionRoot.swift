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
    let rootViewController = ViewController()
    let reachabilityManager = ReachabilityManager()

    return AppDependency(
      window: window,
      rootViewController: rootViewController,
      reachabilityManager: reachabilityManager
    )
  }
}
