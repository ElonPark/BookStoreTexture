//
//  SmartRetryTests.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2022/01/31.
//

import XCTest

import DataLayer

import Nimble
import RxBlocking
import RxSwift

class SmartRetryTests: XCTestCase {
  func test_retry() throws {
    // given
    var errorTimestamps = [Date]()
    let errorSingle = Single<Void>.error(URLError(.dataNotAllowed))
    let backoffStrategy = ExponentialBackoffDecorrelatedJitter(initialDelay: 0.1, maxDelay: 0.3)

    // when
    let result = errorSingle
      .observe(on: MainScheduler.asyncInstance)
      .do(onError: { _ in errorTimestamps.append(Date()) })
      .retry(3, delayOption: .exponential(backoffStrategy))
      .toBlocking(timeout: 3)
      .materialize()

    // then
    switch result {
    case .failed:
      expect(errorTimestamps.count) == 3
      expect(errorTimestamps[0] < errorTimestamps[1] && errorTimestamps[1] < errorTimestamps[2]) == true

    case .completed:
      fail()
    }
  }
}
