//
//  SearchModelMapperSpec.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2022/02/02.
//

@testable import BookStoreTexture

import DataLayer

import Quick
import Nimble
import Combine

class SearchModelMapperSpec: QuickSpec {

  override func spec() {
    describe("검색_결과를_변환할때") {
      var mapper: SearchModelMapper!

      beforeEach {
        mapper = SearchModelMapper()
      }

      context("검색_결과에_오류코드가_정상이고") {
        context("정상적으로_값을_변환하면") {
          it("변환된_값을_반환해요") {
            // given
            let searchResult = SearchResult(
              error: "0",
              total: "1",
              page: "1",
              books: [
                SearchResult.Book(
                  title: "test",
                  subtitle: "test",
                  isbn13: "12345",
                  price: "99.99",
                  image: "https://itbook.store/img/books/9781617294136.png",
                  url: "https://itbook.store/books/9781617294136",
                  pdf: [
                    "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                    "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                  ]
                )
              ]
            )

            // when
            var mapperError: Error?
            var response: SearchResponse?
            let mapToSearchResponse = mapper.mapToSearchResponse()
            do {
              response = try mapToSearchResponse(searchResult)
            } catch {
              mapperError = error
            }

            // then
            expect(response?.total) == 1
            expect(response?.page) == 1
            expect(response?.books.count) == 1
            expect(response?.books.first?.title) == "test"
            expect(response?.books.first?.subtitle) == "test"
            expect(response?.books.first?.isbn13) == "12345"
            expect(response?.books.first?.price) == "99.99"
            expect(response?.books.first?.image) == URL(string: "https://itbook.store/img/books/9781617294136.png")
            expect(response?.books.first?.url) == URL(string: "https://itbook.store/books/9781617294136")
            expect(response?.books.first?.pdf.count) == 2

            let pdfURL = URL(string: "https://itbook.store/files/9781617294136/chapter2.pdf")
            expect(response?.books.first?.pdf["Chapter 2"]) == pdfURL
            expect(mapperError).to(beNil())
          }

          describe("검색_결과_정보_중에") {
            context("total이_숫자가_아니라면") {
              it("오류응답을_반환해요") {
                // given
                let searchResult = SearchResult(
                  error: "0",
                  total: "test",
                  page: "1",
                  books: [
                    SearchResult.Book(
                      title: "test",
                      subtitle: "test",
                      isbn13: "12345",
                      price: "99.99",
                      image: "https://itbook.store/img/books/9781617294136.png",
                      url: "https://itbook.store/books/9781617294136",
                      pdf: [
                        "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                        "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                      ]
                    )
                  ]
                )

                // when
                var mapperError: Error?
                var response: SearchResponse?
                let mapToSearchResponse = mapper.mapToSearchResponse()
                do {
                  response = try mapToSearchResponse(searchResult)
                } catch {
                  mapperError = error
                }

                // then
                expect(response).to(beNil())
                expect(mapperError as? SearchError) == SearchError.mappingError
              }

              context("page가_숫자가_아니라면") {
                it("오류응답을_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "test",
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: "test",
                        isbn13: "12345",
                        price: "99.99",
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: [
                          "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                          "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                        ]
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response).to(beNil())
                  expect(mapperError as? SearchError) == SearchError.mappingError
                }
              }

              context("total이_nil이라면") {
                it("오류응답을_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: nil,
                    page: "1",
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: "test",
                        isbn13: "12345",
                        price: "99.99",
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: [
                          "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                          "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                        ]
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response).to(beNil())
                  expect(mapperError as? SearchError) == SearchError.mappingError
                }
              }

              context("page가_nil이라면") {
                it("오류응답을_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: nil,
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: "test",
                        isbn13: "12345",
                        price: "99.99",
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: [
                          "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                          "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
                        ]
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response).to(beNil())
                  expect(mapperError as? SearchError) == SearchError.mappingError
                }
              }

              context("books가_nil이라면") {
                it("오류응답을_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "1",
                    books: nil
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response).to(beNil())
                  expect(mapperError as? SearchError) == SearchError.mappingError
                }
              }
            }

            describe("책_정보에") {
              context("price가_존재하지_않으면") {
                it("값을_변경하고_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "1",
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: nil,
                        isbn13: nil,
                        price: nil,
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: [
                          "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                          "Chapter 5": "테스트"
                        ]
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response?.books.first?.price) == "-"
                  expect(mapperError).to(beNil())
                }
              }

              context("pdf에_url값이_잘못_되어있다면") {
                it("해당_pdf만_제거하고_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "1",
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: "test",
                        isbn13: "12345",
                        price: "99.99",
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: [
                          "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
                          "Chapter 5": "테스트"
                        ]
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response?.books.first?.pdf.count) == 1
                  expect(mapperError).to(beNil())
                }
              }

              context("pdf값이_nil이라면") {
                it("빈_딕셔너리를_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "1",
                    books: [
                      SearchResult.Book(
                        title: "test",
                        subtitle: "test",
                        isbn13: "12345",
                        price: "99.99",
                        image: "https://itbook.store/img/books/9781617294136.png",
                        url: "https://itbook.store/books/9781617294136",
                        pdf: nil
                      )
                    ]
                  )

                  // when
                  var mapperError: Error?
                  var response: SearchResponse?
                  let mapToSearchResponse = mapper.mapToSearchResponse()
                  do {
                    response = try mapToSearchResponse(searchResult)
                  } catch {
                    mapperError = error
                  }

                  // then
                  expect(response?.books.first?.pdf.count) == 0
                  expect(response?.books.first?.pdf) == [:]
                  expect(mapperError).to(beNil())
                }
              }
            }
          }

          context("검색_결과_오류코드가_정상이_아니라면") {
            it("오류응답을_반환해요") {
              // given
              let searchResult = SearchResult(
                error: "[search] Invalid request",
                total: nil,
                page: nil,
                books: nil
              )

              // when
              var mapperError: Error?
              var response: SearchResponse?
              let mapToSearchResponse = mapper.mapToSearchResponse()
              do {
                response = try mapToSearchResponse(searchResult)
              } catch {
                mapperError = error
              }

              // then
              expect(response).to(beNil())
              switch (mapperError as? SearchError) {
              case let .responseError(string):
                expect(string) == "[search] Invalid request"

              case .mappingError:
                fail("검색결과에 오류코드가 비정상이라면 SearchError.responseError를 반환해야 해요!")

              case nil:
                fail("Mapper에서 에러가 발생하면 SearchError를 반환해야해요")
              }
            }
          }
        }
      }
    }
  }
}
