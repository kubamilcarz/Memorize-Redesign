//
//  CardsList.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct CardsList: View {
    
    var deck: Deck?
    var cards: [Card]
    
    init(deck: Deck) {
        self.deck = deck
        self.cards = deck.cards
    }
    
    init(with cards: [Card]) {
        self.cards = cards
    }
    
    var body: some View {
        if cards.isEmpty {
            VStack {
                MemorizeImage(.typewriter, width: 200)
                
                Group {
                    if let deck {
                        Text("You haven’t added cards to \(deck.name) deck yet.")
                    } else {
                        Text("You haven't added any cards yet.")
                    }
                }
                .font(.memorizeCaption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 200)
            }
            .frame(minHeight: 250)
            .padding(.horizontal)
        } else {
            VStack(spacing: 0) {
                ForEach(cards.indices, id: \.self) { index in
                    NavigationLink {
                        CardPreview(for: cards[index])
                    } label: {
                        cardCell(card: cards[index], index: index)
                    }
                    .buttonStyle(.plain)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
    }
    
    private func cardCell(card: Card, index: Int) -> some View {
        HStack(spacing: 15) {
            HStack {
                Text(card.front)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Spacer()
            }
            
            HStack {
                Text(card.back)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.caption)
            }
        }
        .font(.memorizeBody)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(
            Rectangle().fill(.ultraThinMaterial).opacity(index % 2 == 0 ? 1 : 0.1)
        )

    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList(with: Deck.dummy[0].cards)
    }
}
