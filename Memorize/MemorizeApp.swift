//
//  MemorizeApp.swift
//  Memorize
//
//  Created by 刘君 on 2021/10/11.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
