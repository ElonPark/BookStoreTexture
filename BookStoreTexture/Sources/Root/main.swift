//
//  main.swift
//  BookStoreTexture
//
//  Created by Elon on 2021/12/30.
//

import UIKit

UIApplicationMain(
  CommandLine.argc,
  CommandLine.unsafeArgv,
  NSStringFromClass(UIApplication.self),
  NSStringFromClass(NSClassFromString("BookStoreTextureTests.AppDelegateTestDouble") ?? AppDelegate.self)
)
