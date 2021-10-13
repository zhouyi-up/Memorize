//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 刘君 on 2021/10/11.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["🀃","🀀","🀁","🀂","🀅","🀄︎","🀇","🀈","🀉","🀊","🀋","🀌","🀍","🀎","🀏","🀐","🀆","🀑","🀒","🀓","🀔","🀕","🀖","🀗","🀘","🀙","🀚","🀛","🀜","🀝","🀞","🀟","🀠","🀡","🀢","🀣","🀤","🀥","🀦","🀧","🀨","🀩"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards:6) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card){
        model.choose(card)
    }
}
