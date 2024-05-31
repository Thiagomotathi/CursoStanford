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

//protocolos são apenas formas de structs and classes and enums dizerem que são capazes de mostrar determinados comportamentos de outras estruturas
//no entatanto nenhum dos dois lados precisa mostrar o que são, isso substitui o tipo de forma prática e não perde dados
//vc engana o computer



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



//import Foundation // importando a biblioteca padrão
//
//// criando uma struct de nome MemoryGame que contém dois tipos de vars / um array de tipos card e uma funçãzo que detremina o escolhido ou clicado
//struct MemoryGame<CardContent> {
//    var cards:Array<Card>
//    
//    func choose(card: Card) {
//        
//    }
//    
//    struct Card {
//        var isFaceUp: Bool // var para saber o estado do card para cima ou para baixo
//        var isMatched: Bool // var para definir se dois cartões são iguais ou não são 
//        var content: CardContent // CardContent é um tipo de var que não importa dentro da MemoryGame /podemos colocar oq quisermos
//    }
//}

