//
//  BaseDisplayNode.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/02/01.
//

import AsyncDisplayKit

class BaseDisplayNode: ASDisplayNode {

  override init() {
    super.init()
    self.automaticallyManagesSubnodes = true
  }
}
