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
            Text("cards")
        }
    }
}

struct CardsList_Previews: PreviewProvider {
    static var previews: some View {
        CardsList(with: Deck.dummy[0].cards)
    }
}
