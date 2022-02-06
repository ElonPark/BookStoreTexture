//
//  BooksAPI.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

public enum BooksAPI {
  case bookDetails(isbn13: String)
}

extension BooksAPI: TargetType {
  public var baseURL: URL {
    return BookStoreInformation.API.url
  }

  public var method: Moya.Method {
    return .get
  }

  public var path: String {
    switch self {
    case let .bookDetails(isbn13):
      return "/books/\(isbn13)"
    }
  }

  public var task: Task {
    return .requestPlain
  }

  public var sampleData: Data {
    return sampleDataFactory.makeFixtureData()
  }
}

extension BooksAPI: EndpointTastable {
  public var sampleDataFactory: FixtureFactory {
    return BooksAPISampleDataFactory(endpoint: self)
  }
}
