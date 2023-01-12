//
//  DeckCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckCell: View {
    
    var deck: Deck?
    var isPlaceholder: Bool
    
    init(for deck: Deck) {
        self.deck = deck
        self.isPlaceholder = false
    }
    
    init(isPlaceholder: Bool = true) {
        self.isPlaceholder = isPlaceholder
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if let deck {
                    deck.color.opacity(0.75)
                } else {
                    Color.secondary.opacity(0.75)
                }
                
                VStack {
                    Spacer()
                    
                    if let deck {
                        Image(systemName: deck.icon)
                            .font(.system(size: geo.size.width * 0.25))
                    } else {
                        Image(systemName: "ellipsis")
                            .font(.system(size: geo.size.width * 0.25))
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Group {
                            if let deck {
                                Text(deck.name)
                            } else {
                                Text("More")
                            }
                        }
                        .font(.memorizeCaption)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(maxHeight: 50)
                    }
                    .padding(.horizontal, 5)
                }
                .foregroundColor(.white.opacity(0.85))
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .aspectRatio(7/9, contentMode: .fit)
    }
}

struct DeckCell_Previews: PreviewProvider {
    static var previews: some View {
        DeckCell(for: Deck.dummy[0])
            .frame(width: 250)
    }
}
