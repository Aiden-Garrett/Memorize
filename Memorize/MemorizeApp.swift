//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Aiden Garrett on 2022-12-20.
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
