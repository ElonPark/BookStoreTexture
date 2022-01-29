//
//  ReachabilityManager.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Reachability

/// @mockable
protocol ReachabilityManageable {
  func configureReachability()
}

final class ReachabilityManager: ReachabilityManageable {

  private let reachability: Reachability?

  init() {
    self.reachability = try? Reachability()
  }

  func configureReachability() {
    do {
      try self.reachability?.startNotifier()
    } catch {
      Log.error(error)
    }
  }
}
