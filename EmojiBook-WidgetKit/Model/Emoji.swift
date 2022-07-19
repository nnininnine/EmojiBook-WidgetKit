//
//  Emoji.swift
//  EmojiBook-WidgetKit
//
//  Created by 7Peaks (Nine) on 19/7/2565 BE.
//

import Foundation

typealias Emojis = [Emoji]

struct Emoji: Identifiable {
  let id: UUID = .init()
  let emoji: String
  let name: String
  let description: String
}
