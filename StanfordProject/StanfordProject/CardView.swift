//
//  CardView.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 28/07/24.
//

import SwiftUI

struct CardView: View {// colocando a base do processo de formação dos cards
    typealias Card = MemoryGame<String>.Card
    let card: Card //var constante / genérica com duas partes
    
    init(_ card: Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            
            Group { // agrupados porq utilizarão as mesmas propiedades
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: Constants.lineWidth)
                Path {p in
                    p.move(to: .zero)
                    p.addLine(to: CGPoint(x:50, y: 200))
                }
                Pie(endAngle: .degrees(240))
                    .opacity(Constants.Pie.opacity)
                    .overlay (
                        Text(card.content)
                            .font(.system(size:Constants.FontSize.largest))
                            .minimumScaleFactor(Constants.FontSize.scaleFactor)
                            .aspectRatio( 1, contentMode: .fit)
                            .padding(Constants.Pie.inset)
                    ) 
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0: 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor: CGFloat = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

struct CardView_Previews: PreviewProvider {
    typealias Card = CardView.Card
    
    static var previews: some View {
        VStack {
            Group {
                HStack {
                    CardView(Card(isFaceUp: true, content: "X", id: "test1"))
                    CardView(Card(content: "X", id: "test1"))
                }
                HStack {
                    CardView(Card(isFaceUp: true,isMatched: true, content: "X", id: "test1"))
                    CardView(Card(isMatched: true,content: "X", id: "test1"))
                }
                .foregroundColor(.green)
            }
            .padding()
            
        }
    }
}
