//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Pasha on 25/5/20.
//  Copyright © 2020 MemorizeApp. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                    }
                }
            .foregroundColor(.orange)
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    var card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: cornerRadius)
            if card.isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
    }
}
