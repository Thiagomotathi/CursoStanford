//
//  MemorizeGame.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 24/05/24.
//

////This line declares a struct named MemoryGame. The <CardContent> 
////syntax indicates that this struct is generic. It can hold any type
////of data in the content property of its Card inner struct (defined later).
///
///
////protocolos são apenas formas de structs and classes and enums dizerem que são capazes de mostrar determinados comportamentos de outras estruturas
////no entatanto nenhum dos dois lados precisa mostrar o que são, isso substitui o tipo de forma prática e não perde dados
////vc engana o computer


import Foundation // importando a biblioteca padrão

// criando uma struct de nome MemoryGame que contém dois tipos de vars / 
// um array de tipos card e uma funçãzo que detremina o escolhido ou clicado

struct MemoryGame<CardContent: Equatable> { //TODO: ler sobre generics na documentação do Swift
    private (set) var cards: Array<Card> //TODO: prq é uma private(set) var ?
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        
        //add numberOfPairsOfCards x 2
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    //a var precisa ser opcional porque quando o jogo começa não há nehum index definido pois todas as cartas estão viradas para baixo
    var indexOfTheOneAndOnlyFaceUpCard : Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if (cards[chosenIndex].content == cards[potentialMatchIndex].content) {
                        //then we have a match!!!
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true  //Use this method to toggle a Boolean value from T / F
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()//função para embaralhar
        print(cards)// atualiza na view
    }
    
    
    //protocolos Equatable:
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp: Bool = true //var para saber o estado do card para cima ou para baixo
        var isMatched: Bool = false // var para definir se dois cartões são iguais ou não são
        var content: CardContent// CardContent é um tipo de var que não importa dentro da MemoryGame /podemos colocar oq quisermos
        var id: String
        var debugDescription: String { //para debugar e identificar principais problemas
            "\(id):\(content)\(isFaceUp ? "up" :"down")\(isMatched ? "matched": "")"
        }
    }
}

extension Array {
    var only : Element? {
       count == 1 ? first : nil
    }
}
