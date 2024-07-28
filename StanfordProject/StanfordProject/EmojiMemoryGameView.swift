//
//  EmojiMemoryGameView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame  //essa var aponta para uma instancia da classe EmojiMEmoryGame / é obsevable prq se algo mudar essa view é redesenhada
    private let aspectRatio : CGFloat = 2/3
    private let spacing : CGFloat = 4 
    
    // MARK: - Views - UI da tela
    
    var body: some View { // declaração da view que corresponde ao acesso do user
        VStack {
                cards
                    .foregroundColor(viewModel.color)
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
        AspectVgrid(viewModel.cards, aspectRatio: aspectRatio ) { card in
            CardView(card) //passa o indice e lê o card
                .padding(spacing)
                .onTapGesture { //transforma cada card em um botão /executa uma func
                    viewModel.choose(card)
                }
        }
    }
}

//func cu() {
//    var nums : [Int] = []
//    if !(nums[0]%2 == 0){
//        for num in nums.count {
//            num = 0
//        }
//        
//    }
//    nums.append(2)
//}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

