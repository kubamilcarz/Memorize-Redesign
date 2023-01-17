//
//  DeckSummaryCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct DeckSummaryCell: View {
    
    var deck: Deck
    
    init(for deck: Deck) {
        self.deck = deck
    }
    
    var body: some View {
        GeometryReader { geom in
            HStack(spacing: 10) {
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        Text("1251")
                        Text("213").foregroundColor(.memorizePink)
                        Text("128").foregroundColor(.memorizeOrange)
                        Text("559").foregroundColor(.memorizeBlue)
                        Text("351").foregroundColor(.memorizeGreen)
                    }
                    .fontWeight(.semibold)
                    
                    VStack(alignment: .leading) {
                        Text("Cards")
                        Text("Favorites").foregroundColor(.memorizePink)
                        Text("Hard").foregroundColor(.memorizeOrange)
                        Text("Not Seen").foregroundColor(.memorizeBlue)
                        Text("Known").foregroundColor(.memorizeGreen)
                    }
                }
                .lineLimit(1)
                .font(.memorizeCaption)
                
                Spacer()
                
                DeckSummaryCircularStats(for: deck)
                    .frame(width: (geom.size.width-40) / 3)
                    .padding(.vertical)
            }
            .padding(.horizontal, 10)
            .frame(width: geom.size.width, height: geom.size.height)
        }
    }
}

struct DeckSummaryCell_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 15) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100)
            
            DeckSummaryCell(for: Deck.dummy[0])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal)
        .frame(height: 150)
    }
}
