//
//  Theme.swift
//  BookStoreTexture
//
//  Created by Elon on 2022/01/24.
//

import UIKit

enum Theme {
  enum Color {
    static var background: UIColor { .systemBackground }
    static var imageBackground: UIColor { .systemGray.withAlphaComponent(0.5) }
    static var separator: UIColor { .separator }
    static var labelText: UIColor { .label }
    static var secondaryLabelText: UIColor { .secondaryLabel }
    static var linkText: UIColor { .link }
    static var yellow: UIColor { .systemYellow }
  }

  enum Font {
    static var title: UIFont { .preferredFont(forTextStyle: .headline) }
    static var subtitle: UIFont { .preferredFont(forTextStyle: .subheadline) }
    static var contents: UIFont { .preferredFont(forTextStyle: .body) }
  }
}
