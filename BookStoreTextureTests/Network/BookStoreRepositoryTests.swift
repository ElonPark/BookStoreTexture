//
//  BookStoreRepositoryTests.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2022/01/31.
//

import XCTest

@testable import BookStoreTexture
import Nimble

class BookStoreRepositoryTests: XCTestCase {

  var repository: BookStoreRepository!

  override func tearDownWithError() throws {
    self.repository = nil
  }

  func makeRepository(network: Networking) -> BookStoreRepository {
    return BookStoreRepositoryImpl(networkProvider: network)
  }
}


// MARK: - Search

extension BookStoreRepositoryTests {
  func test_검색_요청에_성공응답이_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let query = "test"
    let network = Network(stubClosure: Network.immediatelyStub)
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestSearchResult(byQuery: query)

    // then
    let result = try await response.value
    expect(result.error) == "0"
    expect(result.books?.first?.isbn13).notTo(beNil())
  }

  func test_검색_요청에_오류응답이_내려와도_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let query = "test"
    let network = Network(
      endpointClosure: { target in
        SearchAPI.endpointErrorResponseClosure(target.target as! SearchAPI)
      },
      stubClosure: Network.immediatelyStub
    )
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestSearchResult(byQuery: query)

    // then
    let result = try await response.value
    expect(result.error) != "0"
    expect(result.books).to(beNil())
  }
}


// MARK: - Search Next Page

extension BookStoreRepositoryTests {
  func test_검색결과_다음페이지_요청시_성공응답이_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let query = "test"
    let page = 2
    let network = Network(stubClosure: Network.immediatelyStub)
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestSearchResult(byQuery: query, withNextPageNumber: page)

    // then
    let result = try await response.value
    expect(result.error) == "0"
    expect(result.books?.first?.isbn13).notTo(beNil())
  }

  func test_검색결과_다음페이지_요청시_에러응답이_내려와도_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let query = "test"
    let page = 2
    let network = Network(
      endpointClosure: { target in
        SearchAPI.endpointErrorResponseClosure(target.target as! SearchAPI)
      },
      stubClosure: Network.immediatelyStub
    )
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestSearchResult(byQuery: query, withNextPageNumber: page)

    // then
    let result = try await response.value
    expect(result.error) != "0"
    expect(result.books).to(beNil())
  }
}


// MARK: - Book Details

extension BookStoreRepositoryTests {
  func test_책_상세정보_요청시_성공응답이_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let isbn13 = "9781617294136"
    let network = Network(stubClosure: Network.immediatelyStub)
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestBookDetails(byISBN13: isbn13)

    // then
    let result = try await response.value
    expect(result.error) == "0"
    expect(result.isbn13) == "9781617294136"
  }

  func test_책_상세정보_요청시_에러응답이_내려와도_정상적으로_변환되는지_테스트해요() async throws {
    // given
    let isbn13 = "9781617294136"
    let network = Network(
      endpointClosure: { target in
        BooksAPI.endpointErrorResponseClosure(target.target as! BooksAPI)
      },
      stubClosure: Network.immediatelyStub
    )
    self.repository = self.makeRepository(network: network)

    // when
    let response = repository.requestBookDetails(byISBN13: isbn13)

    // then
    let result = try await response.value
    expect(result.error) != "0"
    expect(result.isbn13).to(beNil())
  }
}
