//
//  BookStoreRepository.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import RxSwift

/// @mockable
public protocol BookStoreRepository {
  func requestSearchResultByQuery(_ query: String) -> Single<SearchResult>
  func requestSearchResultByQuery(_ query: String, withPage page: Int) -> Single<SearchResult>
  func requestBookDetails(byISBN13 isbn13: String) -> Single<BoolDetails>
}

public final class BookStoreRepositoryImpl: NetworkRepository, BookStoreRepository {

  public func requestSearchResultByQuery(_ query: String) -> Single<SearchResult> {
    return self.request(SearchAPI.search(query: query))
      .map(SearchResult.self)
  }
  
  public func requestSearchResultByQuery(_ query: String, withPage page: Int) -> Single<SearchResult> {
    return self.request(SearchAPI.searchWithPagination(query: query, page: page))
      .map(SearchResult.self)
  }
  
  public func requestBookDetails(byISBN13 isbn13: String) -> Single<BoolDetails> {
    return self.request(BooksAPI.bookDetails(isbn13: isbn13))
      .map(BoolDetails.self)
  }
}
