//
//  Backoff.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

/// [Exponential Backoff And Jitter](https://aws.amazon.com/ko/blogs/architecture/exponential-backoff-and-jitter/)
public class Backoff {

  let initialDelay: Double
  let maxDelay: Double

  public init(initialDelay: Double, maxDelay: Double) {
    self.initialDelay = initialDelay
    self.maxDelay = maxDelay
  }

  func exponential(attempt: Double) -> Double {
    return min(self.maxDelay, pow(2, attempt) * self.initialDelay)
  }
}
