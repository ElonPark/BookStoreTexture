//
//  DisposablesManageable.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import RxSwift

public protocol DisposablesManageable {
  func disposeDisposables()
  func resetDisposables()
}

public extension DisposablesManageable where Self: HasCompositeDisposable {
  func disposeDisposables() {
    self.disposables.dispose()
  }

  func resetDisposables() {
    self.disposables.dispose()
    self.disposables = CompositeDisposable()
  }
}
