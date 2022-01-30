//
//  Network.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya
import RxSwift

protocol Networking {
  func request(
    _ target: TargetType,
    retryCount: Int,
    initialDelay: Double,
    maxDelay: Double,
    file: String,
    function: String,
    line: UInt
  ) -> Single<Response>
}

final class Network: MoyaProvider<MultiTarget>, Networking {

  func request(
    _ target: TargetType,
    retryCount: Int,
    initialDelay: Double,
    maxDelay: Double,
    file: String,
    function: String,
    line: UInt
  ) -> Single<Response> {
    let request: Single<Response>
    let multiTarget = Moya.MultiTarget.target(target)

    #if DEBUG
      let requestString = "\(target.method.rawValue) \(target.path)"
      request = rx.request(multiTarget)
        .do(
          onSuccess: { response in
            let message = "SUCCESS: \(requestString) (\(response.description))"
            Log.debug(fileName: file, line: line, funcName: function, message)
          },
          onError: { error in
            let errorDescriptor = NetworkErrorDescriptor(error: error)
            let errorLogMessage = errorDescriptor.errorLogMessage()
            let message = "FAILURE: \(requestString)\n\(errorLogMessage)"
            Log.warning(fileName: file, line: line, funcName: function, message)
          },
          onSubscribed: {
            let message = "REQUEST: \(requestString)"
            Log.debug(fileName: file, line: line, funcName: function, message)
          }
        )
    #else
      request = rx.request(multiTarget)
    #endif

    if retryCount > 0 {
      let backoffStrategy = ExponentialBackoffDecorrelatedJitter(initialDelay: initialDelay, maxDelay: maxDelay)
      return request.retry(retryCount, delayOption: .exponential(backoffStrategy))
    } else {
      return request
    }
  }
}
