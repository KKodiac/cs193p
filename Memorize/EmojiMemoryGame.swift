//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sean Hong on 2022/01/22.
//
// ViewModel of MVVM

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    
    typealias Card = MemoryGame<String>.Card
    
    // static is created only ONCE when EmojiMemoryGame instance is created in app
    static let emojis = ["🚁", "🚇", "🚃", "🚀", "🚐", "🚙", "🚌", "🚅", "🚆",
                  "🛴", "🚜", "🛳", "✈️","🚠", "🚔", "🏎", "🚡", "🚞",
                  "🚕", "🏍", "🚢", "🛺", "⛴", "🚲"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
