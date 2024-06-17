//
//  AspectVgrid.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 16/06/24.
//

import SwiftUI

struct AspectVgrid<Item: Identifiable, ItemView: View>: View { //protocolo layout behave like a view
    var items: [Item]
    var aspectRatio: CGFloat = 1
    var content: (Item) -> ItemView
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = gridItemWidthThatFits(
                count: items.count,
                size: geometry.size,
                atAspectRatio: 2/3
            )
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize),spacing: 0)],spacing: 0) { // declaraçào de elementos dinâmicos em grid
                ForEach(items) { item in
                    content(item)
                        .aspectRatio( aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemWidthThatFits( count: Int,size: CGSize,atAspectRatio aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 1.0
        
        repeat { //do while
            let width = size.width / columnCount
            let heigth = width / aspectRatio
            let rowCount = (count / columnCount).rounded(.up)
            
            if rowCount * heigth < size.height {
                return(size.width / columnCount).rounded(.down)
            }
            columnCount += 1
        } while columnCount < count
        
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}


