//
//  MemorizeGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 24/05/24.
//

import Foundation

struct MemoryGame {
    var cards : [Card]
    
    func choose(card : Card ) {
        
    }
    
    struct Card {
        var isFaceUp:Bool
        var isMatched: Bool
        var Content: String 
    }
}
