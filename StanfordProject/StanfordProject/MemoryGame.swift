//
//  MemorizeGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 24/05/24.
//

import Foundation

//This line declares a struct named MemoryGame. The <CardContent> 
//syntax indicates that this struct is generic. It can hold any type
//of data in the content property of its Card inner struct (defined later).

struct MemoryGame<CardContent> { // TODO: ler sobre generics na documentação do Swift
//     adicionam-se modificadores dessa var prq quero torná-la acesível apenas dentro do escopo onde foi declarada
//     set -> permite impede a leitura de uma var para que não aconteçam modificações seguintes nela
    private (set) var cards : [Card]
    
    init(numberOfPairsOfCards: Int, cardContentFActory: (Int) -> CardContent) { //uma função também é um tipo de var / determinação de uma programaçào funcional
        cards = []
        // add numberOfCards x 2 cards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFActory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card : Card ) {
        
    }
     
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
