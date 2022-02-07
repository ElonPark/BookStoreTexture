//
//  BaseNavigationController.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import BookStoreTextureUI

class BaseNavigationController: BSTNavigationController {

  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
