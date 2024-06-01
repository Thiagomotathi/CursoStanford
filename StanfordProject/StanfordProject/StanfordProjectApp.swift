//
//  StanfordProjectApp.swift
//  StanfordProject
//
//  Created by ThiagoMotaMachado on 22/05/24.
//

import SwiftUI

@main
struct StanfordProjectApp: App {
    @StateObject var game = EmojiMemoryGame() // para permitir que sejam criados varios games
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
