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

  let emoji: Emoji

  // MARK: Body

  var body: some View {
    ZStack {
      Color.indigo

      VStack {
        Text(emoji.emoji)
          .font(.system(size: 56))
        Text(emoji.name)
          .font(.headline)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding([.leading, .trailing])
      }
    }
  }
}

struct EmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiWidgetView(emoji: EmojiProvider.shared.rand())
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
