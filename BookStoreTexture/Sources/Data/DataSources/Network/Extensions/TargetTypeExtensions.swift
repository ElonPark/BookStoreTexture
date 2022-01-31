//
//  TargetTypeExtensions.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

extension TargetType {
  var headers: [String : String]? {
    return nil
  }
}

extension TargetType where Self: EndpointTastable {
  var sampleData: Data {
    return sampleDataFactory.makeFixtureData()
  }
}
