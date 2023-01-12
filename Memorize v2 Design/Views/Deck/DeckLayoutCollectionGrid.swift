//
//  DeckLayoutCollectionGridCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckLayoutCollectionGridCell: View {
    @EnvironmentObject var vm: DecksRootView.ViewModel
    
    var collection: DeckGroup
    
    init(for collection: DeckGroup) {
        self.collection = collection
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack {
                    HStack {
                        Image(systemName: collection.icon)
                            .foregroundColor(collection.color)
                        Text(collection.name)
                            .lineLimit(1)
                    }
                    .font(.memorizeBody)
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Study All")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 3)
                                .foregroundColor(.white)
                                .background(Color.accentColor, in: Capsule())
                        }
                        .buttonStyle(.plain)
                        .font(.memorizeCaption2)
                        
                        Menu {
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                        .tint(.secondary)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                Divider()
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(getDecks(decks: collection.decks)) { deck in
                    DeckCell(for: deck)
                }
                
                if collection.decks.count > 5 {
                    DeckCell(isPlaceholder: true)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
    
    private func getDecks(decks: [Deck]) -> [Deck] {
        if decks.count < 6 {
            return decks
        }
        
        return Array(decks.prefix(5))
    }
}

struct DeckLayoutCollectionGridCell_Previews: PreviewProvider {
    static var previews: some View {
        DeckLayoutCollectionGridCell(for: DeckGroup.dummy[2])
    }
}
