//
//  HasDisposeBag.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import RxSwift

public protocol HasDisposeBag {
  var disposeBag: DisposeBag { get set }
}
