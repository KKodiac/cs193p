//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/22.
//
// ViewModel of MVVM

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    // static is created only ONCE when EmojiMemoryGame instance is created in app
    static let emojis = ["🚁", "🚇", "🚃", "🚀", "🚐", "🚙", "🚌", "🚅", "🚆",
                  "🛴", "🚜", "🛳", "✈️","🚠", "🚔", "🏎", "🚡", "🚞",
                  "🚕", "🏍", "🚢", "🛺", "⛴", "🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
