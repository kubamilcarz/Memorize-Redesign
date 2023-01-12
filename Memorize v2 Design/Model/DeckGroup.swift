//
//  DeckGroup.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct DeckGroup: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var color: Color
    var decks: [Deck]
    
    static let dummy: [DeckGroup] = [
        .init(name: "Spanish", icon: "flag", color: .memorizeOrange, decks: [
            Deck.dummy[1],
            Deck.dummy[2],
            Deck.dummy[4],
            Deck.dummy[7],
            Deck.dummy[5]
        ]),
        .init(name: "History", icon: "flame", color: .memorizeGreen, decks: [
            Deck.dummy[5],
            Deck.dummy[6],
            Deck.dummy[7],
            Deck.dummy[3],
            Deck.dummy[4],
            Deck.dummy[3],
            Deck.dummy[1]
        ]),
        .init(name: "Geography", icon: "globe.desk", color: .memorizeRed, decks: [
            Deck.dummy[0],
            Deck.dummy[3],
            Deck.dummy[4],
            Deck.dummy[1],
            Deck.dummy[2]
        ])
    ]
}

