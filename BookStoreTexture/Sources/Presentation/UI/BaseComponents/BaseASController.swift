//
//  BaseASController.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import AsyncDisplayKit
import RxSwift
import Then

class BaseASViewController: ASDKViewController<BaseDisplayNode> {

  // MARK: Properties

  var disposeBag = DisposeBag()


  // MARK: Initializing

  override init() {
    let baseNode = BaseDisplayNode().then {
      $0.backgroundColor = Theme.Color.background
    }
    super.init(node: baseNode)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    Log.verbose("\(type(of: self))")
  }
}
