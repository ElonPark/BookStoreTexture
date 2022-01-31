//
//  SearchAPISampleDataFactory.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//


import Moya

struct SearchAPISampleDataFactory: FixtureFactory {

  let endpoint: SearchAPI

  var errorResponse: String {
      """
      {
        "error": "[search] Invalid request"
      }
      """
  }

#if DEBUG
  func makeFixtureData() -> Data {
    switch endpoint {
    case .search:
      return convertToData(from: searchResponse)
    case .searchWithPagination:
      return convertToData(from: searchWithPaginationResponse)
    }
  }
#else
  func makeFixtureData() -> Data {
    return Data()
  }
#endif
}

#if DEBUG
extension SearchAPISampleDataFactory {
  var searchResponse: String {
    """
    {
      "error": "0",
      "total": "118",
      "page": "1",
      "books": [
        {
          "title": "A Swift Kickstart, 2nd Edition",
          "subtitle": "Introducing the Swift Programming Language",
          "isbn13": "9780983066989",
          "price": "$29.99",
          "image": "https://itbook.store/img/books/9780983066989.png",
          "url": "https://itbook.store/books/9780983066989"
        },
        {
          "title": "iOS 15 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781098118501",
          "price": "$48.49",
          "image": "https://itbook.store/img/books/9781098118501.png",
          "url": "https://itbook.store/books/9781098118501"
        },
        {
          "title": "Learn Computer Science with Swift",
          "subtitle": "Computation Concepts, Programming Paradigms, Data Management, and Modern Component Architectures with Swift and Playgrounds",
          "isbn13": "9781484230657",
          "price": "$17.23",
          "image": "https://itbook.store/img/books/9781484230657.png",
          "url": "https://itbook.store/books/9781484230657"
        },
        {
          "title": "Deep Learning with Swift for TensorFlow",
          "subtitle": "Differentiable Programming with Swift",
          "isbn13": "9781484263297",
          "price": "$36.13",
          "image": "https://itbook.store/img/books/9781484263297.png",
          "url": "https://itbook.store/books/9781484263297"
        },
        {
          "title": "OpenStack Swift",
          "subtitle": "Using, Administering, and Developing for Swift Object Storage",
          "isbn13": "9781491900826",
          "price": "$5.31",
          "image": "https://itbook.store/img/books/9781491900826.png",
          "url": "https://itbook.store/books/9781491900826"
        },
        {
          "title": "iOS 8 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781491908907",
          "price": "$3.65",
          "image": "https://itbook.store/img/books/9781491908907.png",
          "url": "https://itbook.store/books/9781491908907"
        },
        {
          "title": "iOS 9 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781491936771",
          "price": "$4.25",
          "image": "https://itbook.store/img/books/9781491936771.png",
          "url": "https://itbook.store/books/9781491936771"
        },
        {
          "title": "iOS 11 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781491999318",
          "price": "$23.03",
          "image": "https://itbook.store/img/books/9781491999318.png",
          "url": "https://itbook.store/books/9781491999318"
        },
        {
          "title": "iOS 12 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781492044550",
          "price": "$56.77",
          "image": "https://itbook.store/img/books/9781492044550.png",
          "url": "https://itbook.store/books/9781492044550"
        },
        {
          "title": "iOS 14 Programming Fundamentals with Swift",
          "subtitle": "Swift, Xcode, and Cocoa Basics",
          "isbn13": "9781492092094",
          "price": "$41.20",
          "image": "https://itbook.store/img/books/9781492092094.png",
          "url": "https://itbook.store/books/9781492092094"
        }
      ]
    }
    """
  }
}

extension SearchAPISampleDataFactory {
  var searchWithPaginationResponse: String {
    """
    {
      "error": "0",
      "total": "118",
      "page": "2",
      "books": [
        {
          "title": "Implementing Cloud Storage with OpenStack Swift",
          "subtitle": "Design, implement, and successfully manage your own cloud storage cluster using the popular OpenStack Swift software",
          "isbn13": "9781782168058",
          "price": "$23.99",
          "image": "https://itbook.store/img/books/9781782168058.png",
          "url": "https://itbook.store/books/9781782168058"
        },
        {
          "title": "Game Development with Swift",
          "subtitle": "Embrace the mobile gaming revolution and bring your iPhone game ideas to life with Swift",
          "isbn13": "9781783550531",
          "price": "$31.99",
          "image": "https://itbook.store/img/books/9781783550531.png",
          "url": "https://itbook.store/books/9781783550531"
        },
        {
          "title": "Swift 2 Blueprints",
          "subtitle": "Sharpen your skills in Swift by designing and deploying seven fully functional applications",
          "isbn13": "9781783980765",
          "price": "$35.99",
          "image": "https://itbook.store/img/books/9781783980765.png",
          "url": "https://itbook.store/books/9781783980765"
        },
        {
          "title": "Swift Essentials",
          "subtitle": "Get up and running lightning fast with this practical guide to building applications with Swift",
          "isbn13": "9781784396701",
          "price": "$29.99",
          "image": "https://itbook.store/img/books/9781784396701.png",
          "url": "https://itbook.store/books/9781784396701"
        },
        {
          "title": "Swift by Example",
          "subtitle": "Create funky, impressive applications using Swift",
          "isbn13": "9781785284700",
          "price": "$14.80",
          "image": "https://itbook.store/img/books/9781785284700.png",
          "url": "https://itbook.store/books/9781785284700"
        },
        {
          "title": "Application Development with Swift",
          "subtitle": "Develop highly efficient and appealing iOS applications by using the Swift language",
          "isbn13": "9781785288173",
          "price": "$33.26",
          "image": "https://itbook.store/img/books/9781785288173.png",
          "url": "https://itbook.store/books/9781785288173"
        },
        {
          "title": "Mastering Swift 2",
          "subtitle": "Dive into the latest release of the Swift programming language with this advanced Apple development book for creating exceptional iOS and osX applications",
          "isbn13": "9781785886034",
          "price": "$39.99",
          "image": "https://itbook.store/img/books/9781785886034.png",
          "url": "https://itbook.store/books/9781785886034"
        },
        {
          "title": "Learn Swift by Building Applications",
          "subtitle": "Explore Swift programming through iOS app development",
          "isbn13": "9781786463920",
          "price": "$31.99",
          "image": "https://itbook.store/img/books/9781786463920.png",
          "url": "https://itbook.store/books/9781786463920"
        },
        {
          "title": "Hands-On Full-Stack Development with Swift",
          "subtitle": "Develop full-stack web and native mobile applications using Swift and Vapor",
          "isbn13": "9781788625241",
          "price": "$35.99",
          "image": "https://itbook.store/img/books/9781788625241.png",
          "url": "https://itbook.store/books/9781788625241"
        },
        {
          "title": "Hands-On Design Patterns with Swift",
          "subtitle": "Master Swift best practices to build modular applications for mobile, desktop, and server platforms",
          "isbn13": "9781789135565",
          "price": "$44.99",
          "image": "https://itbook.store/img/books/9781789135565.png",
          "url": "https://itbook.store/books/9781789135565"
        }
      ]
    }
    """
  }
}
#endif
