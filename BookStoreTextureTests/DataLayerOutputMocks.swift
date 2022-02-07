///
/// @Generated by Mockolo
///



import EPLogger
import Foundation
import Moya
import RxSwift
@testable import DataLayer


public class BookStoreRepositoryMock: BookStoreRepository {
    public init() { }


    public private(set) var requestSearchResultByQueryCallCount = 0
    public var requestSearchResultByQueryHandler: ((String) -> (Single<SearchResult>))?
    public func requestSearchResultByQuery(_ query: String) -> Single<SearchResult> {
        requestSearchResultByQueryCallCount += 1
        if let requestSearchResultByQueryHandler = requestSearchResultByQueryHandler {
            return requestSearchResultByQueryHandler(query)
        }
        fatalError("requestSearchResultByQueryHandler returns can't have a default value thus its handler must be set")
    }

    public private(set) var requestSearchResultByQueryWithPageCallCount = 0
    public var requestSearchResultByQueryWithPageHandler: ((String, Int) -> (Single<SearchResult>))?
    public func requestSearchResultByQuery(_ query: String, withPage page: Int) -> Single<SearchResult> {
        requestSearchResultByQueryWithPageCallCount += 1
        if let requestSearchResultByQueryWithPageHandler = requestSearchResultByQueryWithPageHandler {
            return requestSearchResultByQueryWithPageHandler(query, page)
        }
        fatalError("requestSearchResultByQueryWithPageHandler returns can't have a default value thus its handler must be set")
    }

    public private(set) var requestBookDetailsCallCount = 0
    public var requestBookDetailsHandler: ((String) -> (Single<BoolDetails>))?
    public func requestBookDetails(byISBN13 isbn13: String) -> Single<BoolDetails> {
        requestBookDetailsCallCount += 1
        if let requestBookDetailsHandler = requestBookDetailsHandler {
            return requestBookDetailsHandler(isbn13)
        }
        fatalError("requestBookDetailsHandler returns can't have a default value thus its handler must be set")
    }
}

