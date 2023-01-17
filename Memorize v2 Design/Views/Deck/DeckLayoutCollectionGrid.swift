//
//  DeckLayoutCollectionGrid.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckLayoutCollectionGrid: View {
    @EnvironmentObject var vm: DecksRootView.ViewModel
    
    var collection: DeckGroup
    
    init(for collection: DeckGroup) {
        self.collection = collection
    }
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(getDecks(decks: collection.decks)) { deck in
                NavigationLink {
                    DeckDetailView(deck: deck)
                } label: {
                    DeckCell(for: deck)
                }
                .buttonStyle(.plain)
            }
            
            if collection.decks.count > 5 {
                DeckCell(isPlaceholder: true)
            }
        }
    }
    
    private func getDecks(decks: [Deck]) -> [Deck] {
        if decks.count < 6 {
            return decks
        }
        
        return Array(decks.prefix(5))
    }
}

struct DeckLayoutCollectionGrid_Previews: PreviewProvider {
    static var previews: some View {
        DeckLayoutCollectionGrid(for: DeckGroup.dummy[2])
    }
}
