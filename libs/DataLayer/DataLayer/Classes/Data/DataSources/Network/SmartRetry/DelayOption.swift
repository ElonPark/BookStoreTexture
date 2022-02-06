//
//  DelayOption.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

// MARK: - DelayOption

public enum DelayOption {
  case immediate
  case constant(time: Double)
  case exponential(BackoffStrategy)
  case custom(closure: (Int) -> Double)
}

public extension DelayOption {
  func makeTimeInterval(_ attempt: Int) -> DispatchTimeInterval {
    var interval: Double {
      switch self {
      case .immediate:
        return 0.0

      case let .constant(time):
        return time

      case let .exponential(backoffStrategy):
        return backoffStrategy.backoff(attempt: attempt)

      case let .custom(closure):
        return closure(attempt)
      }
    }

    return .milliseconds(Int(interval * 1000))
  }
}
