//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aiden Garrett on 2023-08-31.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card> //SET allows other classes/structs can view but not modify
    
    private var indexOfTheOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly //This is returned! (dont need to write return
        }
        
        set {
            cards.indices.forEach({cards[$0].isFaceUp = ($0 == newValue)})
        }
    }
    
    mutating func choose(_ card: Card) {
        //if let chosenIndex = index(of: card) { OLDER WAY
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        { //THE COMMAs ARE LIKE AND
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].content  == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
        }
    }
//    func index(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        // add numberOfPairsOfCards x2 of cards to cards array!
        for pairIndex in (0..<numberOfPairsOfCards) {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content)) //WHY MUST MULTIPLY BY 2
        }
    }
    
    
    
    
    struct Card: Identifiable {
        let id: Int
        
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
    }
}


extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self[0]
        } else {
            return nil
        }
    }
    
}
