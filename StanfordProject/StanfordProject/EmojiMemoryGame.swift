//
//  EmojiMemoryGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 25/05/24.
//

import SwiftUI



class EmojiMemoryGame {// inicialização de uma classe
    private static let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"] // emojis é uma var global
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "😢"
            }
        }
    }
    
    private var model = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - intents
    
    func shuffle() {
        model.cards.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) { //controle de acesso
        model.choose(card)
    }
}
