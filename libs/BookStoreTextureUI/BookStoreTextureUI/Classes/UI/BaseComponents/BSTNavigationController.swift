//
//  BSTNavigationController.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import AsyncDisplayKit

open class BSTNavigationController: ASDKNavigationController {

  public override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
  }

  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
