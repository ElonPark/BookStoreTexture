//
//  BaseASController.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import BookStoreTextureUI
import Utility

import RxSwift

class BaseASViewController: BSTViewController, HasDisposeBag {

  // MARK: Properties

  var disposeBag = DisposeBag()

  // MARK: Initializing

  override init() {
    super.init()
  }
}
