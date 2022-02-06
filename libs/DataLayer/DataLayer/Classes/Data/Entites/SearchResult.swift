//
//  SearchResult.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/31.
//

import Foundation

// MARK: - SearchResult

public struct SearchResult: Decodable {
  public let error: String
  public let total: String?
  public let page: String?
  public let books: [Book]?

  public init(error: String, total: String?, page: String?, books: [SearchResult.Book]?) {
    self.error = error
    self.total = total
    self.page = page
    self.books = books
  }
}


// MARK: - SearchResult.Book

extension SearchResult {
  public struct Book: Decodable {
    public let title: String?
    public let subtitle: String?
    public let isbn13: String?
    public let price: String?
    public let image: String?
    public let url: String?
    public let pdf: [String: String]?

    public init(
      title: String?,
      subtitle: String?,
      isbn13: String?,
      price: String?,
      image: String?,
      url: String?,
      pdf: [String : String]?
    ) {
      self.title = title
      self.subtitle = subtitle
      self.isbn13 = isbn13
      self.price = price
      self.image = image
      self.url = url
      self.pdf = pdf
    }
  }
}
