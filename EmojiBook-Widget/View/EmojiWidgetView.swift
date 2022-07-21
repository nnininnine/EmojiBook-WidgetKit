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

  @Environment(\.widgetFamily) var family: WidgetFamily
  let emoji: Emoji

  // MARK: Body

  @ViewBuilder
  var body: some View {
    switch family {
    case .systemSmall:
      SmallEmojiWidgetView(emoji: emoji)
    case .systemMedium:
      MediumEmojiWidgetView(emoji: emoji)
    case .systemLarge:
      LargeEmojiWidgetView(emoji: emoji)
    case .systemExtraLarge:
      EmptyView()
    @unknown default:
      EmptyView()
    }
  }
}

struct EmojiWidgetView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiWidgetView(emoji: EmojiProvider.shared.rand())
      .previewContext(WidgetPreviewContext(family: .systemMedium))
  }
}
