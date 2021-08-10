//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pavel Strongin on 01/07/2021.
//  Copyright © 2021 MemorizeApp. All rights reserved.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup{
            EmojiMemoryGameView(game: game)
        }
    }
}
