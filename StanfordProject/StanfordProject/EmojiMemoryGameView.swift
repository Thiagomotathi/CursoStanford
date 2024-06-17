//
//  EmojiMemoryGameView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame  //essa var aponta para uma instancia da classe EmojiMEmoryGame / é obsevable prq se algo mudar essa view é redesenhada
    private let aspectRatio : CGFloat = 2/3
    
    // MARK: - Views - UI da tela
    
    var body: some View { // declaração da view que corresponde ao acesso do user
        VStack {
                cards
                    .animation(.default,value: viewModel.cards)
//                    .background(Color.red)
//            .background(Color.gray)
             Button("Shuffle") {
                viewModel.shuffle() // atualiza a view depois de embaralhar os cards
            }
//            .background(Color.blue)
        }
        .padding()
//        .background(Color.yellow)
    }
    
    
    private var cards: some View { // um for para montar todo o grid
        AspectVgrid(items: viewModel.cards, aspectRatio: aspectRatio ) { card in
            CardView(card) //passa o indice e lê o card
                .padding(4)
                .onTapGesture { //transforma cada card em um botão /executa uma func
                    viewModel.choose(card)
                }
        }
        .foregroundColor(Color.orange)
    }
}

        
struct CardView: View { // colocando a base do processo de formação dos cards
    let card: MemoryGame<String>.Card //var constante / genérica com duas partes
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            
            Group { // agrupados porq utilizarão as mesmas propiedades
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                Text(card.content)
                    .font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio( 1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
