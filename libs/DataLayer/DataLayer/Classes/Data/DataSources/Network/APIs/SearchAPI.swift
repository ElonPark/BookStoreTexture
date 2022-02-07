//
//  SearchAPI.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

public enum SearchAPI {
  case search(query: String)
  case searchWithPagination(query: String, page: Int)
}

extension SearchAPI: TargetType {
  public var baseURL: URL {
    return BookStoreInformation.API.url
  }

  public var method: Moya.Method {
    return .get
  }

  public var path: String {
    switch self {
    case let .search(query):
      return "/search/\(query)"

    case let .searchWithPagination(query, page):
      return "/search/\(query)/\(page)"
    }
  }

  public var task: Task {
    return .requestPlain
  }
}

extension SearchAPI: EndpointTastable {
  public var sampleDataFactory: FixtureFactory {
    return SearchAPISampleDataFactory(endpoint: self)
  }
}
