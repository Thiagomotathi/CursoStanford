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

struct MemoryGame<CardContent> {
    var cards : [Card]
    
    func choose(card : Card ) {
        
    }
    
    struct Card {
        var isFaceUp:Bool
        var isMatched: Bool
        var content: CardContent
    }
}
