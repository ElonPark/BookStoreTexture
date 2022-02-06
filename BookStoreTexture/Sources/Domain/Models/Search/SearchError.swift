//
//  SearchError.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import Foundation

enum SearchError: Error, Equatable {
  case responseError(String)
  case mappingError
}
