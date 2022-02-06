//
//  SearchModel.swift
//  BookStoreTexture
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

enum SearchModel {
  enum Search {
    struct Request {
      let query: String
    }

    enum Response {
      case result([SearchResponse.Book])
      case error(Error)
    }
  }

  enum LoadMore {
    struct Request {

    }

    enum Response {
      case result([SearchResponse.Book])
      case error(Error)
    }
  }
}
