//
//  DecksLayoutList.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct DecksLayoutList: View {
    @EnvironmentObject var vm: DecksRootView.ViewModel
    
    var body: some View {
        switch vm.layout {
        case .grid:
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(Deck.dummy) { deck in
                    DeckCell(for: deck)
                }
            }
        case .list:
            VStack {
                ForEach(Deck.dummy) { deck in
                    HStack {
                        Label(deck.name, systemImage: deck.icon)
                        
                        Spacer()
                    }
                }
            }
        case .collectionList:
            VStack {
                ForEach(DeckGroup.dummy) { collection in
                    VStack {
                        Label(collection.name, systemImage: collection.icon)
                        
                        VStack {
                            ForEach(collection.decks) { deck in
                                HStack {
                                    Label(deck.name, systemImage: deck.name)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
            }
        case .collectionGrid:
            VStack {
                ForEach(DeckGroup.dummy) { collection in
                    DeckLayoutCollectionGridCell(for: collection)
                }
            }
        }
            
    }

}

struct DecksLayoutList_Previews: PreviewProvider {
    static var previews: some View {
        DecksLayoutList()
            .environmentObject(DecksRootView.ViewModel())
    }
}
