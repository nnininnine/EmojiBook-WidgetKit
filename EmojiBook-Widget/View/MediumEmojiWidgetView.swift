//
//  MediumEmojiWidgetView.swift
//  EmojiBook-WidgetExtension
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import SwiftUI
import WidgetKit

struct MediumEmojiWidgetView: View {
  // MARK: Properties

  let emoji: Emoji

  // MARK: Body

  var body: some View {
    ZStack {
      Color.indigo

      HStack(alignment: .center) {
        Text(emoji.emoji)
          .font(.system(size: 56))
          .padding(8)
        VStack(alignment: .leading) {
          Text(emoji.name)
            .font(.headline)
          Text(emoji.description)
            .multilineTextAlignment(.leading)
        }
        .foregroundColor(.white)
      }
      .padding()
    }
  }
}

struct MediumEmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    MediumEmojiWidgetView(emoji: EmojiProvider.shared.rand())
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
