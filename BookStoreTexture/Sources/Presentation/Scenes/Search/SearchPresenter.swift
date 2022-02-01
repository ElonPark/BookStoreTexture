//
//  SearchPresenter.swift
//  BookStoreTexture
//
//  Created by Elon Park on 1/2/2022.
//  Copyright © 2022 Elon Park. All rights reserved.
//

import UIKit

/// @mockable
protocol SearchPresentationLogic: AnyObject {
  func presentSearch(response: SearchModel.Search.Response)
  func presentLoadMore(response: SearchModel.LoadMore.Response)
}

final class SearchPresenter {

  weak var viewController: SearchDisplayLogic?

  deinit {
    print("deinit: SearchPresenter")
  }
}

// MARK: - Presentation Logic

extension SearchPresenter: SearchPresentationLogic {

  func presentSearch(response: SearchModel.Search.Response) {

  }

  func presentLoadMore(response: SearchModel.LoadMore.Response) {

  }
}