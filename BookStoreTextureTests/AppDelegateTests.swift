//
//  AppDelegateTests.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2021/12/30.
//

import XCTest

@testable import BookStoreTexture
import Nimble

class AppDelegateTests: XCTestCase {

  private func makeAppDelegate(
    window: UIWindow = .init(),
    rootViewController: UIViewController = .init()
  ) -> AppDelegate {
    return AppDelegate(
      dependency: AppDependency(
        window: window,
        rootViewController: rootViewController
      )
    )
  }
}


// MARK: - didFinishLaunchingWithOptions

extension AppDelegateTests {
  func test_테스트_타겟은_앱델리게이트를_AppDelegateTestDouble을_사용해요() throws {
    // then
    expect(UIApplication.shared.delegate is AppDelegateTestDouble).to(beTrue())
  }

  func test_didFinishLaunchingWithOptions가_호출되면_keyWindow를_설정해요() throws {
    // given
    let window = UIWindow()
    let appDelegate = self.makeAppDelegate(window: window)

    // when
    _ = appDelegate.application(.shared, didFinishLaunchingWithOptions: nil)

    // then
    expect(appDelegate.window) === window
    expect(appDelegate.window?.isKeyWindow) == true
  }

  func test_didFinishLaunchingWithOptions가_호출되면_rootViewController를_설정해요() throws {
    // given
    let window = UIWindow()
    let rootViewController = UIViewController()
    let appDelegate = self.makeAppDelegate(
      window: window,
      rootViewController: rootViewController
    )

    // when
    _ = appDelegate.application(.shared, didFinishLaunchingWithOptions: nil)

    // then
    expect(appDelegate.window) === window
    expect(appDelegate.window?.isKeyWindow) == true

    expect(appDelegate.window?.rootViewController) === rootViewController
  }
}
