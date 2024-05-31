//
//  ContentView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.
//

import SwiftUI

struct ContentView: View {
     
    // MARK: Model - Dados da tela
    let emojis: [String] = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"] //um array de strings
    @State var cardCount: Int = 6
    
    // MARK: Views - UI da tela
    var body: some View { // declaração da view que corresponde ao acesso do user
        VStack {
            ScrollView {
                Cards
            }
            Spacer()
            CardCountAjusters
        }
        .padding()
    }
    
    
    var Cards: some View { //um for para montar todo o grid
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) { // declaraçào de elementos dinâmicos em grid
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(content: emojis[index], isFaceUp: false).aspectRatio( 2/3, contentMode: .fit)
            }
            .padding(.bottom, 1)
        }
        .foregroundColor(.orange)
    }
    
    
    var CardCountAjusters: some View { // chama os botões de adicionar e de diminuir
        HStack{
            CardRemover
            Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    func CardCountAjuster(by offset: Int, symbol:String) -> some View { // criando uma função que retorna uma View que determina o tipo de botão chamado
        Button(action:{
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    var CardRemover: some View {// declaração do botão de remover
        CardCountAjuster(by: -1,symbol: "rectangle.stack.badge.minus.fill")
    }
    var CardAdder: some View {// declaração do botão de adicionar
        CardCountAjuster(by: +1,symbol: "rectangle.stack.badge.plus.fill")
    }
    
}




struct CardView: View {// colocando a base do processo de formação dos cards
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            
            Group {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0: 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
