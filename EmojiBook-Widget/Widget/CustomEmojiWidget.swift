//
//  CustomEmojiWidget.swift
//  EmojiBook-WidgetExtension
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import SwiftUI
import WidgetKit

struct CustomEmojiWidgetProvider: IntentTimelineProvider {
  typealias Entry = CustomEmojiEntry
  typealias Intent = SelectEmojiIntent

  func placeholder(in context: Context) -> CustomEmojiEntry {
    CustomEmojiEntry(date: Date(), emoji: nil)
  }

  func getSnapshot(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (Entry) -> Void) {
    // Use a random emoji in the widget gallery.
    if context.isPreview {
      completion(CustomEmojiEntry(date: Date(), emoji: EmojiProvider.shared.rand()))
      return
    }

    let emoji = lookupEmojiDetails(for: configuration)
    let entry = CustomEmojiEntry(date: Date(), emoji: emoji)

    completion(entry)
  }

  func getTimeline(for configuration: SelectEmojiIntent, in context: Context, completion: @escaping (Timeline<CustomEmojiEntry>) -> Void) {
    var entries = [CustomEmojiEntry]()
    let emoji = lookupEmojiDetails(for: configuration)
    let entry = CustomEmojiEntry(date: Date(), emoji: emoji)
    entries.append(entry)
    let timeline = Timeline(entries: entries, policy: .never)
    completion(timeline)
  }

  private func lookupEmojiDetails(for configuration: SelectEmojiIntent) -> Emoji? {
    guard let emojiId = configuration.emoji?.identifier,
          let emojiForConfig = EmojiProvider.shared.all().first(where: {
            $0.emoji == emojiId
          })
    else {
      return nil
    }
    return emojiForConfig
  }
}

struct CustomEmojiEntry: TimelineEntry {
  let date: Date
  let emoji: Emoji?
}

struct CustomEmojiWidgetEntryView: View {
  var entry: CustomEmojiWidgetProvider.Entry

  @ViewBuilder
  var body: some View {
    if let emoji = entry.emoji {
      EmojiWidgetView(emoji: emoji)
        .widgetURL(emoji.url)
    } else {
      EmojiWidgetPlaceholderView()
    }
  }
}

struct CustomEmojiWidget: Widget {
  private let kind: String = "CustomEmojiWidget"

  public var body: some WidgetConfiguration {
    IntentConfiguration(
      kind: kind,
      intent: SelectEmojiIntent.self,
      provider: CustomEmojiWidgetProvider()
    ) { entry in
      CustomEmojiWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Custom Emoji Widget")
    .description("Display a widget with an emoji of your choice.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}
