//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pasha on 25/5/20.
//  Copyright © 2020 MemorizeApp. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","💀","🕷","🐱","💦"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in:2..<emojis.count + 1)) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: -Intent(s)
    
    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
