//
//  HomeViewModel.swift
//  EmojiBook-WidgetKit
//
//  Created by 7Peaks (Nine) on 19/7/2565 BE.
//

import Foundation

class HomeViewModel: ObservableObject {
  // MARK: Properties

  @Published var isShowDetail: Bool = false
  let emojis: Emojis = EmojiProvider.shared.all()

  // MARK: Init

  init() {}

  // MARK: Methods
}
