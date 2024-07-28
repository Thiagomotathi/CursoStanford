//
//  EmojiMemoryGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 25/05/24.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {// inicialização de uma classe
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"] // emojis é uma var global
    
    private static func createMemoryGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "😢"
            }
        }
    }
        
    @Published private var model = EmojiMemoryGame.createMemoryGame() // marcada como pública para indicar que algo mudou
    
    var cards: Array<Card> {
        model.cards
    }
    
    var color: Color {
        .orange
    }
    
    //MARK: - intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) { //controle de acesso
        model.choose(card)
    }
}
