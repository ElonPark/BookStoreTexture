//
//  SearchModelMapperSpec.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2022/02/02.
//

@testable import BookStoreTexture
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
            let response = mapper.mapToSearchResponse(searchResult)

            switch response {
            case let .result(result):
              expect(result.total) == 1
              expect(result.resultCount) == 1
              expect(result.page) == 1
              expect(result.books.count) == 1
              expect(result.books.first?.title) == "test"
              expect(result.books.first?.subtitle) == "test"
              expect(result.books.first?.isbn13) == "12345"
              expect(result.books.first?.price) == "99.99"
              expect(result.books.first?.image) == URL(string: "https://itbook.store/img/books/9781617294136.png")
              expect(result.books.first?.url) == URL(string: "https://itbook.store/books/9781617294136")
              expect(result.books.first?.pdf.count) == 2

              let pdfURL = URL(string: "https://itbook.store/files/9781617294136/chapter2.pdf")
              expect(result.books.first?.pdf["Chapter 2"]) == pdfURL

            case .error:
              fail("검색결과가 정상이라면 오류를 반환할 수 없어요!")
            }
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
                let response = mapper.mapToSearchResponse(searchResult)

                // then
                switch response {
                case .result:
                  fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

                case let .error(error):
                  expect((error as? SearchError)) == SearchError.mappingError
                }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  // then
                  switch response {
                  case .result:
                    fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

                  case let .error(error):
                    expect((error as? SearchError)) == SearchError.mappingError
                  }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  // then
                  switch response {
                  case .result:
                    fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

                  case let .error(error):
                    expect((error as? SearchError)) == SearchError.mappingError
                  }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  // then
                  switch response {
                  case .result:
                    fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

                  case let .error(error):
                    expect((error as? SearchError)) == SearchError.mappingError
                  }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  // then
                  switch response {
                  case .result:
                    fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

                  case let .error(error):
                    expect((error as? SearchError)) == SearchError.mappingError
                  }
                }
              }
            }

            describe("책_정보에") {
              context("title이_존재하지_않으면") {
                it("해당_책만_제거하고_반환해요") {
                  // given
                  let searchResult = SearchResult(
                    error: "0",
                    total: "1",
                    page: "1",
                    books: [
                      SearchResult.Book(
                        title: nil,
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  switch response {
                  case let .result(result):
                    expect(result.books.count) == 0

                  case .error:
                    fail("검색결과가 정상이라면 오류를 반환할 수 없어요!")
                  }
                }
              }

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
                  let response = mapper.mapToSearchResponse(searchResult)

                  switch response {
                  case let .result(result):
                    expect(result.books.first?.price) == "-"

                  case .error:
                    fail("검색결과가 정상이라면 오류를 반환할 수 없어요!")
                  }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  switch response {
                  case let .result(result):
                    expect(result.books.first?.pdf.count) == 1

                  case .error:
                    fail("검색결과가 정상이라면 오류를 반환할 수 없어요!")
                  }
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
                  let response = mapper.mapToSearchResponse(searchResult)

                  // then
                  switch response {
                  case let .result(result):
                    expect(result.books.first?.pdf.count) == 0
                    expect(result.books.first?.pdf) == [:]

                  case .error:
                    fail("검색결과가 정상이라면 오류를 반환할 수 없어요!")
                  }
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
              let response = mapper.mapToSearchResponse(searchResult)

              // then
              switch response {
              case .result:
                fail("검색결과에 오류코드가 비정상이라면 오류를 반환해야 해요!")

              case let .error(error):
                switch error as? SearchError {
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
}
