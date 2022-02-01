//
//  SearchResponse.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import Foundation

struct SearchResponse {
  let total: Int
  let resultCount: Int
  let page: Int
  let books: [Book]
}

extension SearchResponse {
  struct Book: Decodable, Hashable {
    let title: String
    let subtitle: String?
    let isbn13: String?
    let price: String
    let image: URL?
    let url: URL?
    let pdf: [String: URL]
  }
}
