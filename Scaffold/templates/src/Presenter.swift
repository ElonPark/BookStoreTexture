//
//  __SCENE_NAME__Presenter.swift
//  __TARGET_PROJECT_NAME__
//
//  Created by __COPYRIGHT__ on __DATE__.
//  Copyright © __YEAR__ __COPYRIGHT__. All rights reserved.
//

import UIKit

/// @mockable
protocol __SCENE_NAME__PresentationLogic: AnyObject {
// clean-swift-scaffold-generate-presenter-interface (do-not-remove-comments)
}

final class __SCENE_NAME__Presenter {

  weak var viewController: __SCENE_NAME__DisplayLogic?

  deinit {
    print("deinit: __SCENE_NAME__Presenter")
  }
}

// MARK: - Presentation Logic

extension __SCENE_NAME__Presenter: __SCENE_NAME__PresentationLogic {

// clean-swift-scaffold-generate-presenter-implementation (do-not-remove-comments)
}