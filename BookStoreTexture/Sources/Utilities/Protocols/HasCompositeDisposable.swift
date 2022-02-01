//
//  HasCompositeDisposable.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/02.
//

import RxSwift

protocol HasCompositeDisposable: AnyObject {
  var disposables: CompositeDisposable { get set }
}
