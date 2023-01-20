//
//  CollectionDetailView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/19/23.
//

import SwiftUI

struct CollectionDetailView: View {
    
    var collection: DeckGroup
    
    @State private var isEditModeOn = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ZStack {
                    collection.color.opacity(0.4)
                    
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: collection.icon)
                                .font(.system(size: 60))
                        }
                        .frame(width: 100)
                        .aspectRatio(1/1, contentMode: .fit)
                        
                        VStack {
                            Text(collection.name)
                                .multilineTextAlignment(.center)
                                .font(.memorizeTitle2)
                            
                            Text("7 decks")
                                .font(.memorizeBody)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 30)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
                }
                .foregroundStyle(.secondary)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(collection.color, lineWidth: 2)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                                
                DeckLayoutCollectionGrid(for: collection)

            }
            .padding(.horizontal)
        }
        .navigationTitle(collection.name)
        .navigationBarTitleDisplayMode(.inline)
        
        .toolbar {
            Button("Edit") {
                withAnimation {
                    isEditModeOn.toggle()
                }
            }
        }
    }
}

struct CollectionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CollectionDetailView(collection: DeckGroup.dummy[2])
        }
    }
}
