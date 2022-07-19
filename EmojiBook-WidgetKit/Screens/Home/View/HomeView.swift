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
            vm.isShowDetail = true
          })
          .sheet(isPresented: $vm.isShowDetail, content: {
            Text("\(emoji.emoji) \(emoji.name)")
          })
        }
      }
      .navigationTitle("Emoji Book 🥸")
    }
    .navigationViewStyle(.stack)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
