//
//  SearchResult.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/31.
//

import Foundation

// MARK: - SearchResult

struct SearchResult: Decodable {
  let error: String
  let total: String?
  let page: String?
  let books: [Book]?
}


// MARK: - SearchResult.Book

extension SearchResult {
  struct Book: Decodable {
    let title: String?
    let subtitle: String?
    let isbn13: String?
    let price: String?
    let image: String?
    let url: String?
    let pdf: [String: String]?
  }
}
