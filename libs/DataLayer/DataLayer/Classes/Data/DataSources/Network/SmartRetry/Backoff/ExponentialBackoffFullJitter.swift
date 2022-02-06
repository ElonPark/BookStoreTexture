//
//  ExponentialBackoffFullJitter.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

final class ExponentialBackoffFullJitter: Backoff, BackoffStrategy {

  func backoff(attempt: Int) -> Double {
    let delay = self.exponential(attempt: Double(attempt))
    return Double.random(in: 0...delay)
  }
}
