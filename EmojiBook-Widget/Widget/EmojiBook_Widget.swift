//
//  EmojiBook_Widget.swift
//  EmojiBook-Widget
//
//  Created by Nuttapon Buaban on 20/7/2565 BE.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), emoji: EmojiProvider.shared.rand())
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
    let entry = SimpleEntry(date: Date(), emoji: EmojiProvider.shared.rand())
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
    var entries: [SimpleEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, emoji: EmojiProvider.shared.rand())
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let emoji: Emoji
}

struct EmojiBook_WidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    EmojiWidgetView(emoji: entry.emoji)
      .widgetURL(entry.emoji.url)
  }
}

struct EmojiBook_Widget: Widget {
  let kind: String = "EmojiBook_Widget"

  var body: some WidgetConfiguration {
    StaticConfiguration(
      kind: kind,
      provider: Provider()
    ) { entry in
      EmojiBook_WidgetEntryView(entry: entry)
    }
    .configurationDisplayName("Random Emoji")
    .description("Display a widget with an emoji that is updated randomly.")
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

struct EmojiBook_Widget_Previews: PreviewProvider {
  static var previews: some View {
    EmojiBook_WidgetEntryView(entry: SimpleEntry(date: Date(), emoji: EmojiProvider.shared.rand()))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
