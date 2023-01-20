//
//  BrowseViewViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

extension BrowseRootView {
    
    final class ViewModel: ObservableObject {
        var cards: [Card]
        
        init(cards: [Card]) {
            self.cards = cards.sorted { $0.front < $1.front }
            self.filteredCards = self.cards
        }
        
        
        @Published var searchQuery = ""
        @Published var filteredCards: [Card]
        
    }
    
}
