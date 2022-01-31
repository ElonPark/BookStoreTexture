//
//  SearchAPI.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya

enum SearchAPI {
  case search(query: String)
  case searchWithPagination(query: String, page: Int)
}

extension SearchAPI: TargetType {
  var baseURL: URL {
    return BookStoreInformation.API.url
  }

  var method: Moya.Method {
    return .get
  }

  var path: String {
    switch self {
    case let .search(query):
      return "/search/\(query)"

    case let .searchWithPagination(query, page):
      return "/search/\(query)/\(page)"
    }
  }

  var task: Task {
    return .requestPlain
  }
}

extension SearchAPI: EndpointTastable {
  var sampleDataFactory: FixtureFactory {
    return SearchAPISampleDataFactory(endpoint: self)
  }
}
