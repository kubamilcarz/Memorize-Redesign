//
//  DeckLayoutListCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckLayoutListCell: View {
    var deck: Deck
    
    init(for deck: Deck) {
        self.deck = deck
    }
    
    var body: some View {
        ZStack {
            deck.color.opacity(0.7)
            
            HStack {
                HStack(spacing: 15) {
                    VStack {
                        Image(systemName: deck.icon)
                            .fontWeight(.semibold)
                    }
                    .frame(width: 50, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(deck.color, lineWidth: 2)
                    )
                    .foregroundStyle(.secondary)
                    
                    Text(deck.name)
                        .foregroundStyle(.primary)
                }
                
                Spacer()
                
                HStack {
                    Menu {
                        Button("hello") { }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }

                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                    
                }
                .foregroundStyle(.secondary)
                .buttonStyle(.plain)
            }
            .padding(7)
            .padding(.trailing, 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct DeckLayoutListCell_Previews: PreviewProvider {
    static var previews: some View {
        DeckLayoutListCell(for: Deck.dummy[1])
    }
}
