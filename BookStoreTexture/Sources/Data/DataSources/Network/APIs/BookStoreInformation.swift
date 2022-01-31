//
//  BookStoreInformation.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Foundation

enum BookStoreInformation {
  enum API {
    static let baseURLString = "https://api.itbook.store"
    static let version = "1.0"

    static var urlString: String {
      return "\(baseURLString)/\(version)"
    }

    static var url: URL {
      guard let url = URL(string: urlString) else {
        fatalError("Can't create URL! URLString: \(urlString)")
      }

      return url
    }
  }
}
