//
//  SearchModelMapper.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import Foundation

struct SearchModelMapper {
  func mapToSearchResponse(_ searchResult: SearchResult) -> SearchModel.Search.Response {
    guard searchResult.error == "0" else {
      return SearchModel.Search.Response.error(
        SearchError.responseError(searchResult.error)
      )
    }

    guard let total = searchResult.total.flatMap(Int.init),
          let page = searchResult.page.flatMap(Int.init),
          let bookItems = searchResult.books
    else {
      return SearchModel.Search.Response.error(SearchError.mappingError)
    }

    let resultCount = bookItems.count

    let books = bookItems.compactMap { item -> SearchResponse.Book? in
      guard let title = item.title else { return nil }

      let pdf = item.pdf?.compactMapValues(URL.init) ?? [:]

      return SearchResponse.Book(
        title: title,
        subtitle: item.subtitle,
        isbn13: item.isbn13,
        price: item.price ?? "-",
        image: item.image.flatMap(URL.init),
        url: item.url.flatMap(URL.init),
        pdf: pdf
      )
    }

    return SearchModel.Search.Response.result(
      SearchResponse(
        total: total,
        resultCount: resultCount,
        page: page,
        books: books
      )
    )
  }
}
