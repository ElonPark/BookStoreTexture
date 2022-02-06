//
//  AppDelegateTestDouble.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2021/12/30.
//

import UIKit

final class AppDelegateTestDouble: UIResponder, UIApplicationDelegate {

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {

    return true
  }
}
