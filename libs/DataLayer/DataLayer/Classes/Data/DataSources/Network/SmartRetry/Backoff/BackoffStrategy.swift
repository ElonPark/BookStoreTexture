//
//  BackoffStrategy.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

public protocol BackoffStrategy {
  func backoff(attempt: Int) -> Double
}
