//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pasha on 25/5/20.
//  Copyright © 2020 MemorizeApp. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻","💀","🕷","🐱","💦","🐸","🐨","🐭","🐹","🐰","🦊"]
    //Int.random(in:2..<emojis.count + 1)
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 6) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: Access to the Model
    @Published private var model = EmojiMemoryGame.createMemoryGame()
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: -Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
