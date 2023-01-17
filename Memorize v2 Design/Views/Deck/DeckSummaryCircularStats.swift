//
//  DeckSummaryCircularStats.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct DeckSummaryCircularStats: View {
    var deck: Deck
    
    init(for deck: Deck) {
        self.deck = deck
    }
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 213/1251)
                .stroke(
                    Color.memorizePink,
                    lineWidth: 9
                )
            Circle()
                .trim(from: 213/1251, to: 772/1251)
                .stroke(
                    Color.memorizeBlue,
                    lineWidth: 9
                )
            Circle()
                .trim(from: 772/1251, to: 900/1251)
                .stroke(
                    Color.orange,
                    lineWidth: 9
                )
            Circle()
                .trim(from: 900/1251, to: 1)
                .stroke(
                    Color.memorizeGreen,
                    lineWidth: 9
                )
        }
        .clipShape(Circle().stroke(lineWidth: 9))
    }
}

struct DeckSummaryCircularStats_Previews: PreviewProvider {
    static var previews: some View {
        DeckSummaryCircularStats(for: Deck.dummy[0])
    }
}
