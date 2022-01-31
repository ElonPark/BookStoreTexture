//
//  NetworkRepository.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Moya
import RxSwift

class NetworkRepository {

  private let networkProvider: Networking

  init(networkProvider: Networking) {
    self.networkProvider = networkProvider
  }

  func request(
    _ target: TargetType,
    retryCount: Int = 5,
    initialDelay: Double = 0.5,
    maxDelay: Double = 10.0,
    file: String = #file,
    function: String = #function,
    line: UInt = #line
  ) -> Single<Response> {
    return self.networkProvider.request(
      target,
      retryCount: retryCount,
      initialDelay: initialDelay,
      maxDelay: maxDelay,
      file: file,
      function: function,
      line: line
    )
  }
}
