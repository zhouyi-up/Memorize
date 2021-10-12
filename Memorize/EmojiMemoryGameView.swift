//
//  ContentView.swift
//  Memorize
//
//  Created by 刘君 on 2021/10/11.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    var body: some View {
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                    ForEach(game.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
    
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader{ geometry in
            let shape = RoundedRectangle(cornerRadius: 20.0)
            ZStack {
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
                } else if card.isMatched{
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 13 mini")
            .preferredColorScheme(.dark)
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
