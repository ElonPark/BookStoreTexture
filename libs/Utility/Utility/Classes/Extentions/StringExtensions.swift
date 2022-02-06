//
//  StringExtensions.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/04.
//

import Foundation

public extension Optional where Wrapped == String {
  var isNilOrEmpty: Bool {
    return self?.isEmpty ?? true
  }
}