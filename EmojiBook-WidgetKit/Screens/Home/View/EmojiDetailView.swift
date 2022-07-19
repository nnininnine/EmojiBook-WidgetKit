//
//  EmojiDetailView.swift
//  EmojiBook-WidgetKit
//
//  Created by 7Peaks (Nine) on 19/7/2565 BE.
//

import SwiftUI

struct EmojiDetailView: View {
  // MARK: Properties

  let emoji: Emoji

  // MARK: Body

  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 8) {
        Text(emoji.emoji)
          .font(.system(size: 48))
        Text(emoji.name)
          .font(.title3)
          .foregroundColor(.white)
        Text(emoji.description)
          .font(.body)
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding()
      }
    }
    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    .background(.indigo)
  }
}

struct EmojiDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiDetailView(emoji: EmojiProvider.shared.all()[0])
  }
}
