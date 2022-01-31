//
//  BackoffStrategy.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

protocol BackoffStrategy {
  func backoff(attempt: Int) -> Double
}
