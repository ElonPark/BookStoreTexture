//
//  AppDelegate.swift
//  BookStoreTexture
//
//  Created by Elon on 2021/12/11.
//

import UIKit

import EPLogger

public typealias Log = EPLogger.Log

class AppDelegate: UIResponder, UIApplicationDelegate {


  // MARK: UI Components

  var window: UIWindow?


  // MARK: Properties

  private let dependency: AppDependency


  // MARK: - Initializing

  override init() {
    self.dependency = CompositionRoot.resolve()
    super.init()
  }

  init(dependency: AppDependency) {
    self.dependency = dependency
    super.init()
  }

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    self.configureWindow()
    self.dependency.reachabilityManager.configureReachability()

    return true
  }
}

extension AppDelegate {
  private func configureWindow() {
    self.window = self.dependency.window
    self.window?.rootViewController = self.dependency.rootViewController
    self.window?.makeKeyAndVisible()
  }
}
