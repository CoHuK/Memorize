//
//  Cardify.swift
//  Memorize
//
//  Created by Pavel Strongin on 11/08/2021.
//  Copyright © 2021 MemorizeApp. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.stroke(lineWidth: DrawingConstants.edgeLineWidth)
            }
            else {
                shape.fill()
            }
            content.opacity(isFaceUp ? 1 : 0)
        }
    }
    
    private struct DrawingConstants{
        static let cornerRadius: CGFloat = 10.0
        static let edgeLineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
