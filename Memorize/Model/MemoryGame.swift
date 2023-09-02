//
//  MemoryGame.swift
//  Memorize
//
//  Created by Aiden Garrett on 2023-08-31.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card> //SET allows other classes/structs can view but not modify

    private var indexOfTheOnlyFaceUpCard: Int?
    
    private(set) var score: Int
    
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
                    score += 2
                } else {
                    //Make it so you can -2 if both cards have been seen
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                    
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                
                cards[chosenIndex].hasBeenSeen = true
                cards[potentialMatchIndex].hasBeenSeen = true
                
                indexOfTheOnlyFaceUpCard = nil
                
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
                
            }
            cards[chosenIndex].isFaceUp.toggle()
        } else {
            print("\(cards)")
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
        score = 0
        
        // add numberOfPairsOfCards x2 of cards to cards array!
        for pairIndex in (0..<numberOfPairsOfCards) {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content)) //WHY MUST MULTIPLY BY 2
        }
        
        //Randomize cards
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var hasBeenSeen: Bool = false
        
    }
}
