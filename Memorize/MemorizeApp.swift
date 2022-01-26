//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/16.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
