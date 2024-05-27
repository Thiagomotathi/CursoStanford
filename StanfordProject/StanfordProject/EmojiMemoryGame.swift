//
//  EmojiMemoryGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 25/05/24.
//

import Foundation
func createCardContent(forPairAtIndex index: Int) -> String {
    return ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"][index]
}
class EmojiMemoryGame {
    private var model = MemoryGame<String>(numberOfPairsOfCards: 4, cardContentFActory: createCardContent ) //é uma var privada para que apenas esse arquivo se preocupe com ela / (set) para controlar oq?
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
