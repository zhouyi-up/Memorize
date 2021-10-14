//
//  Cardify.swift
//  Memorize
//
//  Created by 刘君 on 2021/10/14.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0: 180
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    var rotation: Double
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornetRadius)
                if rotation < 90 {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                } else {
                    shape.fill()
                    Text("♦︎")
                        .foregroundColor(.white)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.7))
                }
                content.opacity(rotation < 90 ? 1: 0)
            }
            .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
        }
    }
    
    private struct DrawingConstants{
        static let cornetRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View{
    func cardify(isFaceUp: Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}

