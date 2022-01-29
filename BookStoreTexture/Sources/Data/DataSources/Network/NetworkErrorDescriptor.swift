//
//  NetworkErrorDescriptor.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/30.
//

import Alamofire
import Moya

struct NetworkErrorDescriptor {

  var urlError: URLError? {
    if let urlError = self.error as? URLError {
      return urlError
    }
    return afUnderlyingError as? URLError
  }

  private var moyaError: MoyaError? {
    error as? MoyaError
  }

  private var moyaUnderlyingError: Error? {
    guard case let .underlying(underlyingError, _) = moyaError else { return nil }
    return underlyingError
  }

  private var isMoyaUnderlyingError: Bool {
    moyaUnderlyingError != nil
  }

  private var afError: AFError? {
    guard let moyaUnderlyingError = moyaUnderlyingError else { return error.asAFError }
    return moyaUnderlyingError.asAFError
  }

  private var afUnderlyingError: Error? {
    afError?.underlyingError
  }

  private let error: Error

  init(error: Error) {
    self.error = error
  }

  func errorLogMessage() -> String {
    guard let moyaError = self.moyaError else { return error.localizedDescription }

    var messages = [String]()

    if !self.isMoyaUnderlyingError, let errorDescription = moyaError.errorDescription {
      messages.append("Moya Error Description: \(errorDescription)")
    }

    messages.append(self.afErrorDebugDescriptions().joined(separator: "\n"))
    messages.append(self.urlErrorDebugDescriptions().joined(separator: "\n"))

    if let responseString = self.responseString() {
      messages.append(responseString)
    }

    return messages.filter { !$0.isEmpty }.joined(separator: "\n")
  }

  private func afErrorDebugDescriptions() -> [String] {
    guard let afError = self.afError else { return [] }

    var messages = [String]()

    if let responseCode = afError.responseCode {
      messages.append("Response Code: \(responseCode)")
    }
    if let responseContentType = afError.responseContentType {
      messages.append("Response Content Type: \(responseContentType)")
    }
    if let failureReason = afError.failureReason {
      messages.append("Failure Reason: \(failureReason)")
    }
    if let recoverySuggestion = afError.recoverySuggestion {
      messages.append("Recovery Suggestion: \(recoverySuggestion)")
    }
    if let contentType = afError.responseContentType {
      messages.append("Content Type: \(contentType)")
    }
    if let errorDescription = afError.errorDescription {
      messages.append("Description: \(errorDescription)")
    }

    return messages
  }

  private func urlErrorDebugDescriptions() -> [String] {
    guard let urlError = self.urlError else { return [] }

    var messages = [String]()

    if let urlString = urlError.failureURLString {
      messages.append("Failure URLString: \(urlString)")
    }

    return messages
  }

  private func responseString() -> String? {
    guard let response = moyaError?.response else { return nil }

    if let jsonObject = try? response.mapJSON(failsOnEmptyData: false) {
      return "\(jsonObject)"
    } else if let rawString = String(data: response.data, encoding: .utf8) {
      return "\(rawString)"
    }

    return nil
  }
}
