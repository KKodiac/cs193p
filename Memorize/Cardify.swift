//
//  Cardify.swift
//  Memorize
//
//  Created by Sean Hong on 2022/03/26.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    var rotation: Double // in Degrees
    
    func body(content: Content) -> some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius, style: .circular)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)

            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
    
    
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let scale: CGFloat = 0.65
        static let timerOpacity: CGFloat = 0.5
        static let timerSize: CGFloat = 4
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
