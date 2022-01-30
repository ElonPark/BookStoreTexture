//
//  BookStoreRepository.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import RxSwift

/// @mockable
protocol BookStoreRepository {
  func requestSearchResult(byQuery query: String) -> Single<SearchResult>
  func requestSearchResult(byQuery query: String, withNextPageNumber page: Int) -> Single<SearchResult>
  func requestBookDetails(byISBN13 isbn13: String) -> Single<BoolDetails>
}

final class BookStoreRepositoryImpl: NetworkRepository, BookStoreRepository {

  func requestSearchResult(byQuery query: String) -> Single<SearchResult> {
    return self.request(SearchAPI.search(query: query))
      .map(SearchResult.self)
  }
  
  func requestSearchResult(byQuery query: String, withNextPageNumber page: Int) -> Single<SearchResult> {
    return self.request(SearchAPI.searchWithPagination(query: query, page: page))
      .map(SearchResult.self)
  }
  
  func requestBookDetails(byISBN13 isbn13: String) -> Single<BoolDetails> {
    return self.request(BooksAPI.bookDetails(isbn13: isbn13))
      .map(BoolDetails.self)
  }
}
