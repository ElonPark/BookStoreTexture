//
//  HasCompositeDisposable.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import RxSwift

public protocol HasCompositeDisposable: AnyObject {
  var disposables: CompositeDisposable { get set }
}
