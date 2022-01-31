//
//  NetworkErrorDescriptorSpec.swift
//  BookStoreTextureTests
//
//  Created by Elon on 2022/01/30.
//

import Moya
import Alamofire

@testable import BookStoreTexture
import Quick
import Nimble

class NetworkErrorDescriptorSpec: QuickSpec {

  override func spec() {
    describe("에러를_전달_받았을때") {
      var networkErrorDescriptor: NetworkErrorDescriptor!

      context("URLError라면") {
        let error = URLError(.badServerResponse)
        beforeEach {
          networkErrorDescriptor = NetworkErrorDescriptor(error: error)
        }

        it("urlError는_전달_받은_에러와_동일해요") {
          expect(networkErrorDescriptor.urlError?.code) == error.code
        }

        it("errorLogMessage에서_localizedDescription을_리턴해요") {
          expect(networkErrorDescriptor.errorLogMessage()) == error.localizedDescription
        }
      }

      // MARK: MoyaError

      describe("에러가_MoyaError이고") {
        var networkErrorDescriptor: NetworkErrorDescriptor!

        context("response가_있으면") {
          it("errorLogMessage에_data를_String으로_포함해서_리턴해요") {
            // given
            let jsonString = #"{"test": text}"#
            let response = Response(
              statusCode: -1,
              data: jsonString.data(using: .utf8)!,
              request: nil,
              response: nil
            )
            let error = MoyaError.jsonMapping(response)
            networkErrorDescriptor = NetworkErrorDescriptor(error: error)

            // when

            let errorMessage = networkErrorDescriptor.errorLogMessage()

            // then
            expect(errorMessage).to(contain(jsonString))
          }

          it("errorLogMessage에_json을_String으로_포함해서_리턴해요") {
            // given
            let jsonString = #"{"test": 123}"#
            let response = Response(
              statusCode: -1,
              data: jsonString.data(using: .utf8)!,
              request: nil,
              response: nil
            )
            let error = MoyaError.statusCode(response)
            networkErrorDescriptor = NetworkErrorDescriptor(error: error)

            // when
            let errorMessage = networkErrorDescriptor.errorLogMessage()

            // then
            expect(errorMessage).to(contain("test = 123"))
          }
        }

        describe("UnderlyingError일떄") {
          context("AFError라면") {
            let afError = AFError.responseValidationFailed(
              reason: .unacceptableStatusCode(code: 999)
            )
            let error = MoyaError.underlying(afError, nil)
            beforeEach {
              networkErrorDescriptor = NetworkErrorDescriptor(error: error)
            }

            it("errorLogMessage에서_responseCode가_있으면_을_포함해서_리턴해요") {
              let responseCodeMessage = "Response Code: \(afError.responseCode!)"
              expect(networkErrorDescriptor.errorLogMessage()).to(contain(responseCodeMessage))
            }

            it("errorLogMessage에서_AFErrorDescription을_포함해서_리턴해요") {
              expect(networkErrorDescriptor.errorLogMessage()).to(contain(afError.errorDescription!))
            }
          }
        }

        context("UnderlyingError가 아니라면") {
          let error = MoyaError.requestMapping("test")
          beforeEach {
            networkErrorDescriptor = NetworkErrorDescriptor(error: error)
          }

          it("errorLogMessage에서_MoraErrorDescription을_포함해서_리턴해요") {
            expect(networkErrorDescriptor.errorLogMessage()).to(contain(error.errorDescription!))
          }
        }
      }
    }
  }
}
