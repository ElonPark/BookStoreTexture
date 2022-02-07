//
//  ExponentialBackoffDecorrelatedJitter.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

public final class ExponentialBackoffDecorrelatedJitter: Backoff, BackoffStrategy {

  private var delay: Double

  public override init(initialDelay: Double, maxDelay: Double) {
    self.delay = initialDelay
    super.init(initialDelay: initialDelay, maxDelay: maxDelay)
  }

  public func backoff(attempt: Int) -> Double {
    self.delay = min(self.maxDelay, Double.random(in: self.initialDelay...self.delay * 3))
    return self.delay
  }
}
