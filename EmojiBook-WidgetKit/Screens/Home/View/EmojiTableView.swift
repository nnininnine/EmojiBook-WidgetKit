//
//  EmojiTableView.swift
//  EmojiBook-WidgetKit
//
//  Created by 7Peaks (Nine) on 19/7/2565 BE.
//

import SwiftUI

struct EmojiTableView: View {
  let emoji: Emoji
  var action: () -> Void = {}

  var body: some View {
    Button(action: action, label: {
      Text("\(emoji.emoji) \(emoji.name)")
        .font(.title2)
        .foregroundColor(Color(uiColor: .label))
    })
  }
}

struct EmojiTableView_Previews: PreviewProvider {
  static var previews: some View {
    EmojiTableView(emoji: EmojiProvider.shared.all()[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
