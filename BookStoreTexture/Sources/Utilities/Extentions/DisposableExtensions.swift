//
//  DisposableExtensions.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import RxSwift

extension Disposable {

  /// Adds self to `CompositeDisposable`
  ///
  /// - parameter disposables: `CompositeDisposable` to add self to.
  func disposed(by compositeDisposable: CompositeDisposable) {
    _ = compositeDisposable.insert(self)
  }

  /// Adds self to `SerialDisposable`
  ///
  /// - parameter disposables: `SerialDisposable` to add self to.
  func disposed(by serialDisposable: SerialDisposable) {
    serialDisposable.disposable = self
  }
}
