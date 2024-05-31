//
//  EmojiMemoryGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 25/05/24.
//

import SwiftUI

func createCardContent(forPairAtIndex index: Int) -> String { // função global
    return ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"][index]
}

class EmojiMemoryGame { //TODO:  procurar como que funciona a implementação de classes em swiftUi !!!!
    private var model: MemoryGame<String> = MemoryGame(
        numberOfPairsOfCards: 4, 
        cardContentFActory: { pairIndex in
            return ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"][pairIndex]
        }
    )
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}


//import SwiftUI
//
//class EmojiMemoryGame {
//    var model: MemoryGame<String>
//}
