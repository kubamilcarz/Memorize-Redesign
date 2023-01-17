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
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(Deck.dummy) { deck in
                    NavigationLink {
                        DeckDetailView(deck: deck)
                    } label: {
                        DeckCell(for: deck)
                    }
                    .buttonStyle(.plain)
                }
            }
        case .list:
            VStack(spacing: 10) {
                ForEach(Deck.dummy) { deck in
                    NavigationLink {
                        DeckDetailView(deck: deck)
                    } label: {
                        DeckLayoutListCell(for: deck)
                    }
                    .buttonStyle(.plain)
                }
            }
        case .collectionList:
            VStack(spacing: 10) {
                ForEach(DeckGroup.dummy) { collection in
                    VStack(spacing: 10) {
                        DeckLayoutColllectionHeader(for: collection)

                        VStack(spacing: 10) {
                            ForEach(collection.decks) { deck in
                                NavigationLink {
                                    DeckDetailView(deck: deck)
                                } label: {
                                    DeckLayoutListCell(for: deck)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding([.horizontal, .bottom], 10)
                    }
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
            }
        case .collectionGrid:
            VStack(spacing: 10) {
                ForEach(DeckGroup.dummy) { collection in
                    VStack(spacing: 10) {
                        DeckLayoutColllectionHeader(for: collection)
                        
                        DeckLayoutCollectionGrid(for: collection)
                            .padding([.horizontal, .bottom], 10)
                    }
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
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
