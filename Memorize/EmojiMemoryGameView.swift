//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Aiden Garrett on 2022-12-20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame //This is the viewModel

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
                .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
    }
    
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
//
//    var remove: some View {
//        Button {
//            if emojiCount >= 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
}

struct CardView: View {

    let card: MemoryGame<String>.Card
    
    var body: some View {
       GeometryReader(content: {geometry in
           ZStack {
               let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
               if card.isFaceUp {
                   shape.fill().foregroundColor(.white)
                   shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                   Text(card.content).font(font(in: geometry.size))
               } else if card.isMatched {
                   shape.opacity(0)
               } else {
                   shape.fill()
               }
           }
       })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
