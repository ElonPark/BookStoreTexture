//
//  Network.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya
import RxSwift

final class Network<Target: TargetType>: MoyaProvider<Target> {
  func request(
    _ target: Target,
    file: String = #file,
    function: String = #function,
    line: UInt = #line
  ) -> Single<Response> {
    #if DEBUG
      let requestString = "\(target.method.rawValue) \(target.path)"
      let request = rx.request(target)
        .do(onSuccess: { response in
          let message = "SUCCESS: \(requestString) (\(response.description))"
          Log.debug(fileName: file, line: line, funcName: function, message)
        }, onError: { error in
          let errorDescriptor = NetworkErrorDescriptor(error: error)
          let errorLogMessage = errorDescriptor.errorLogMessage()
          let message = "FAILURE: \(requestString)\n\(errorLogMessage)"
          Log.warning(fileName: file, line: line, funcName: function, message)

        }, onSubscribed: {
          let message = "REQUEST: \(requestString)"
          Log.debug(fileName: file, line: line, funcName: function, message)
        })

      return request
    #else
      return rx.request(target)
    #endif
  }
}
