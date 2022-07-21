//
//  SmallEmojiWidgetView.swift
//  EmojiBook-WidgetExtension
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import SwiftUI
import WidgetKit

struct SmallEmojiWidgetView: View {
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

struct SmallEmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    SmallEmojiWidgetView(emoji: EmojiProvider.shared.rand())
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
