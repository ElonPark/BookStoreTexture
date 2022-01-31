//
//  BooksAPI.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

enum BooksAPI {
  case bookDetails(isbn13: String)
}

extension BooksAPI: TargetType {
  var baseURL: URL {
    return BookStoreInformation.API.url
  }

  var method: Moya.Method {
    return .get
  }

  var path: String {
    switch self {
    case let .bookDetails(isbn13):
      return "/books/\(isbn13)"
    }
  }

  var task: Task {
    return .requestPlain
  }

  var sampleData: Data {
    return sampleDataFactory.makeFixtureData()
  }
}

extension BooksAPI: EndpointTastable {
  var sampleDataFactory: FixtureFactory {
    return BooksAPISampleDataFactory(endpoint: self)
  }
}
