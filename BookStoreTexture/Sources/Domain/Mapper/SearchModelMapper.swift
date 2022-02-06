//
//  SearchModelMapper.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import Foundation

struct SearchModelMapper {
  func mapToSearchResponse() -> (SearchResult) throws -> SearchResponse {
    return { searchResult in
      guard searchResult.error == "0" else { throw SearchError.responseError(searchResult.error) }

      guard
        let total = searchResult.total.flatMap(Int.init),
        let page = searchResult.page.flatMap(Int.init),
        let bookItems = searchResult.books
      else {
        throw SearchError.mappingError
      }

      let books = bookItems.map {
        SearchResponse.Book(
          title: $0.title,
          subtitle: $0.subtitle,
          isbn13: $0.isbn13,
          price: $0.price ?? "-",
          image: $0.image.flatMap(URL.init),
          url: $0.url.flatMap(URL.init),
          pdf: $0.pdf?.compactMapValues(URL.init) ?? [:]
        )
      }

      return SearchResponse(total: total, page: page, books: books)
    }
  }
}
