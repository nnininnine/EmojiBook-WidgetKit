//
//  LargeEmojiWidgetView.swift
//  EmojiBook-WidgetExtension
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import SwiftUI
import WidgetKit

struct LargeEmojiWidgetView: View {
  // MARK: Properties

  let emoji: Emoji

  // MARK: Body

  var body: some View {
    ZStack {
      Color.indigo

      VStack {
        Text(emoji.name)
          .font(.title)
          .bold()
        Text(emoji.emoji)
          .font(.system(size: 56))
          .padding(4)
        Text(emoji.description)
          .font(.title3)
      } //: VStack
      .padding()
      .foregroundColor(.white)
      .multilineTextAlignment(.center)
    } //: ZStack
  }
}

struct LargeEmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    LargeEmojiWidgetView(emoji: EmojiProvider.shared.rand())
      .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
