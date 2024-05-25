//
//  EmojiMemoryGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 25/05/24.
//

import Foundation
 
class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> //é uma var privada para que apenas esse arquivo se preocupe com ela / (set) para controlar oq?
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
