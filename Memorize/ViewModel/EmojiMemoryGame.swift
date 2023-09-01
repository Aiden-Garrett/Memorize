//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aiden Garrett on 2023-08-31.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis =  ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜", "🛴", "🚲", "🛵", "🛺", "🚠", "🚂", "✈️", "🚁", "🚀", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        //Rewatch 1:23 for cool explimation of line below (MMMV lec 3)
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Intent(s) (user intents)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
    
    
}
