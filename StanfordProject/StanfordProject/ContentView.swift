//
//  ContentView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♂️","🙀","👹","😱","☠️","🍭"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            Cards
            CardCountAjusters
        }
        .padding()
    }
    
    
    var Cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(content: emojis[index], isFaceUp: false)
            }
        }
        .foregroundColor(.orange)
    }
    
    
    var CardCountAjusters: some View { // chama os botões de adicionar e de diminuir
        HStack{
            CardRemover
            Spacer()
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    
    func CardCountAjuster(by offset: Int, symbol:String) -> some View{
        Button(action:{
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
    }
    
    var CardRemover: some View { //  var botão que remove cards
        Button(action:{
            if cardCount > 1{
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    
    
}




struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                ZStack {
                    base.foregroundColor(.orange)
                }
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
