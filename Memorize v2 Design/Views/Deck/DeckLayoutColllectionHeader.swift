//
//  DeckLayoutColllectionHeader.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckLayoutColllectionHeader: View {
    
    var collection: DeckGroup
    
    init(for collection: DeckGroup) {
        self.collection = collection
    }
    
    var body: some View {
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
                    MemorizeCapsuleButton("Study All") { }
                    
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
    }
}

struct DeckLayoutColllectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        DeckLayoutColllectionHeader(for: DeckGroup.dummy[1])
    }
}
