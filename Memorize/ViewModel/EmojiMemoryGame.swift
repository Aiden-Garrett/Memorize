//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Aiden Garrett on 2023-08-31.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
        
    static let themes: Array<Theme> = [
        Theme(name: "Transportation", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜", "🛴", "🚲", "🛵", "🛺", "🚠", "🚂", "✈️", "🚁", "🚀", "🛶"],
              numberOfCards: 10, color: "red"),
        Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🏏", "🏒", "🏏"], numberOfCards: 10, color: "blue"),
        Theme(name: "Animals", emojis: ["🐕", "🐈‍⬛", "🐋", "🦈", "🦭", "🐊", "🐅", "🦏", "🦬", "🐃", "🐄", "🐏", "🐓", "🦃", "🦤", "🦫", "🦨", "🦡", "🦥", "🦧", "🦍", "🦏"], numberOfCards: 11, color: "green"),
        Theme(name: "Nature", emojis: ["🌵", "🌲", "🌳", "🌴", "🍀", "🍄", "🪸", "🌎", "☀️", "☁️", "🌧️", "🌩️", "❄️", "☄️", "🌕", "🌸", "🌺", "🪷", "🪻", "🌹", "🌷", "🪸", "🌾", "🪸", "🪺"], numberOfCards: 12, color: "green"),
        Theme(name: "food", emojis: ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍈", "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🫛", "🥦", "🥬", "🥒", "🌶️", "🌽", "🥕", "🥔", "🍠", "🫒", "🧄", "🥐", "🍞", "🥨", "🧀", "🥚", "🥞"], numberOfCards: 13, color: "yellow"),
        Theme(name: "Flags", emojis: ["🇨🇦", "🇨🇱", "🇰🇾", "🇮🇨", "🇨🇳", "🇹🇩", "🇨🇮", "🇯🇵", "🇯🇲", "🇰🇷", "🇺🇸", "🇬🇧"], numberOfCards: 8, color: "orange")
    ]
    
    private(set) var theme: Theme = themes.randomElement()!
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        //Rewatch 1:23 for cool explimation of line below (MMMV lec 3)
        MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(theme: themes.randomElement()!)
        
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    
    // MARK: - Intent(s) (user intents)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        //Randomize theme and emojis
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
}
