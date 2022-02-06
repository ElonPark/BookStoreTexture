//
//  FixtureFactory.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

public protocol FixtureFactory {
  var errorResponse: String { get }

  func makeFixtureData() -> Data
}

public extension FixtureFactory {
  func makeFixtureData() -> Data {
    return Data()
  }

  func convertToData(from responseFixture: String) -> Data {
    guard let data = responseFixture.data(using: .utf8) else {
      preconditionFailure("Can't convert data from fixture string. Fixture: \(self)")
    }

    return data
  }
}
