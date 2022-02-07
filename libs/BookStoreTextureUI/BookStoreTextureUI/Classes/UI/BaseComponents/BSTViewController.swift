//
//  BSTViewController.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import AsyncDisplayKit
import Then

open class BSTViewController: ASDKViewController<BSTDisplayNode> {

  // MARK: Initializing

  public override init() {
    let baseNode = BSTDisplayNode().then {
      $0.backgroundColor = Theme.Color.background
    }
    super.init(node: baseNode)
  }

  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print("\(type(of: self))")
  }
}
