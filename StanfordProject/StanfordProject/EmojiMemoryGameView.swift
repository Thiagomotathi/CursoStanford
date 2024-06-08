//
//  EmojiMemoryGameView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame  //essa var aponta para uma instancia da classe EmojiMEmoryGame / é obsevable prq se algo mudar essa view é redesenhada
    
    // MARK: - Views - UI da tela
    
    var body: some View { // declaração da view que corresponde ao acesso do user
        VStack {
            ScrollView { // para garantir o scroll dos cards
                Cards
                    .animation(.default,value: viewModel.cards)//queremos animar todos os cards / por isso adicionamos animações do tipo deafault e setamos no que queremos usar essa prop
            }
            Button("Shuffle") {
                viewModel.shuffle() // atualiza a view depois de embaralhar os cards
            }
        }
        .padding()
    }
        
    var Cards: some View { // um for para montar todo o grid
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)],spacing: 0) { // declaraçào de elementos dinâmicos em grid
            ForEach(viewModel.cards) { card in //dispõe os cards na View
                CardView(card) //passa o indice e lê o card
                    .aspectRatio( 2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {//transforma cada card em um botão /executa uma func
                        viewModel.choose(card)
                    }
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
