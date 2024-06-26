//
//  DecksRootViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import Foundation

extension DecksRootView {
    final class ViewModel: ObservableObject {
        
        @Published var layout: DeckLayout = .collectionGrid
        
        @Published var isShowingNewDeckSheet = false
        @Published var editingDeck: Deck?
        
        @Published var isShowingNewCardSheet = false
        
        
        func changeLayout(to newLayout: DeckLayout) {
            layout = newLayout
        }
    }
}
