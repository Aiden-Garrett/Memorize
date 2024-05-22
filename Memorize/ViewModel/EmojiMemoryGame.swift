//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aiden Garrett on 2023-08-31.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    
    private static let emojis =  ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜", "🛴", "🚲", "🛵", "🛺", "🚠", "🚂", "✈️", "🚁", "🚀", "🛶"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        //Rewatch 1:23 for cool explimation of line below (MMMV lec 3)
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    
    // MARK: - Intent(s) (user intents)
    
    func choose(_ card: Card) { //This usues the typealisas Card!
        model.choose(card)
    }
    
    
    
    
}
