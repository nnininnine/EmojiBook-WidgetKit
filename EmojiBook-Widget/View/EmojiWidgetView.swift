//
//  EmojiWidgetView.swift
//  EmojiBook-WidgetExtension
//
//  Created by Nuttapon Buaban on 20/7/2565 BE.
//

import SwiftUI
import WidgetKit

struct EmojiWidgetView: View {
  // MARK: Properties

  // MARK: Body

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

struct EmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiWidgetView()
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
