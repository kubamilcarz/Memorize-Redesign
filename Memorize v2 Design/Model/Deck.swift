//
//  Deck.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct Deck: Identifiable, Hashable {
    static func == (lhs: Deck, rhs: Deck) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var description: String
    var color: Color
    var icon: String
    var cards: [Card]
    
    static let dummy: [Deck] = [
        .init(name: "World Rivers", description: "", color: .memorizeRed, icon: "globe.americas", cards: []),
        .init(name: "Fruits and Vegetables", description: "", color: .memorizeOrange, icon: "carrot", cards: []),
        .init(name: "Capital Cities", description: "", color: .memorizeYellow, icon: "house.lodge", cards: []),
        .init(name: "Weather", description: "", color: .memorizeGreen, icon: "cloud.drizzle", cards: []),
        .init(name: "Civil War", description: "", color: .memorizeMint, icon: "oar.2.crossed", cards: []),
        .init(name: "Holocaust", description: "", color: .memorizeBlue, icon: "flame", cards: []),
        .init(name: "Band History", description: "", color: .memorizeNavy, icon: "guitars", cards: []),
        .init(name: "Civil War", description: "", color: .memorizePink, icon: "oar.2.crossed", cards: []),
        .init(name: "Holocaust", description: "", color: .memorizePurple, icon: "flame", cards: []),
        .init(name: "Band History", description: "", color: .memorizeGray, icon: "guitars", cards: [])
    ]
}
