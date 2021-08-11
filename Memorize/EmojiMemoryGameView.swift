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
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
        })
            .foregroundColor(.orange)
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
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if card.isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.stroke(lineWidth: DrawingConstants.edgeLineWidth)
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 120-90))
                    .padding(4).opacity(0.5)
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
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10.0
        static let edgeLineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.75
    }

    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * DrawingConstants.fontScale
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}
