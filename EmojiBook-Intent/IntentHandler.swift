//
//  IntentHandler.swift
//  EmojiBook-Intent
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import Intents

class IntentHandler: INExtension {
  override func handler(for intent: INIntent) -> Any {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.

    return self
  }
}

// MARK: Extensions

extension IntentHandler: SelectEmojiIntentHandling {
  func provideEmojiOptionsCollection(for intent: SelectEmojiIntent, with completion: @escaping (INObjectCollection<EmojiINO>?, Error?) -> Void) {
    var emojiItems: [EmojiINO] = .init()
    for emoji in EmojiProvider.shared.all() {
      let emojiINO = EmojiINO(identifier: emoji.emoji, display: "\(emoji.emoji) \(emoji.name)")

      emojiItems.append(emojiINO)
    }
    completion(INObjectCollection(items: emojiItems), nil)
  }
}
