//
//  HomeView.swift
//  EmojiBook-WidgetKit
//
//  Created by 7Peaks (Nine) on 19/7/2565 BE.
//

import SwiftUI

struct HomeView: View {
  // MARK: Properties

  @StateObject private var vm: HomeViewModel = .init()

  // MARK: Body

  var body: some View {
    NavigationView {
      List {
        ForEach(vm.emojis) { emoji in
          EmojiTableView(emoji: emoji, action: {
            vm.selectedEmoji = emoji
          })
        }
      }
      .navigationTitle("Emoji Book 🥸")
    }
    .onOpenURL { url in
      print(url)
    }
    .sheet(item: $vm.selectedEmoji, content: { EmojiDetailView(emoji: $0) })
    .navigationViewStyle(.stack)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
