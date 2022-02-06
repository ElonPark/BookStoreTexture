//
//  TargetTypeExtensions.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

public extension TargetType {
  var headers: [String : String]? {
    return nil
  }
}

public extension TargetType where Self: EndpointTastable {
  var sampleData: Data {
    return sampleDataFactory.makeFixtureData()
  }
}
