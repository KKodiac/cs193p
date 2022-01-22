//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/22.
//
// ViewModel of MVVM

import SwiftUI

class EmojiMemoryGame {
    // static is created only ONCE when EmojiMemoryGame instance is created in app
    static let emojis = ["🚁", "🚇", "🚃", "🚀", "🚐", "🚙", "🚌", "🚅", "🚆",
                  "🛴", "🚜", "🛳", "✈️","🚠", "🚔", "🏎", "🚡", "🚞",
                  "🚕", "🏍", "🚢", "🛺", "⛴", "🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
