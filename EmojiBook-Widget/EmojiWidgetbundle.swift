//
//  EmojiWidgetbundle.swift
//  EmojiBook-WidgetExtension
//
//  Created by 7Peaks (Nine) on 21/7/2565 BE.
//

import SwiftUI
import WidgetKit

@main
struct EmojiWidgetBundle: WidgetBundle {
  @WidgetBundleBuilder
  var body: some Widget {
    CustomEmojiWidget()
    EmojiBook_Widget()
  }
}
