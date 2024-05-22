//
//  ContentView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.
//

import SwiftUI

struct ContentView: View {              //essa estrutura se comporta como uma view por isso existe a importação de um protocolo
    var body: some View {               //views são como legos, segundo o cara de Stanford
        VStack {
            HStack {
                CardView(isFaceUp: false)
                CardView(isFaceUp: false)
                CardView(isFaceUp: true)
                CardView(isFaceUp: true)
            }
            .foregroundColor(.orange)
            .padding()
        }
    }
}




struct CardView: View {
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 3)
                Text("👻").font(.largeTitle)
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
