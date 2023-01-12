//
//  Deck.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct Deck: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var color: Color
    var icon: String
    var cards: [Card]
    
    static let dummy: [Deck] = [
        .init(name: "World Rivers", description: "", color: .memorizeBlue, icon: "globe.americas", cards: []),
        .init(name: "Fruits and Vegetables", description: "", color: .memorizeYellow, icon: "carrot", cards: []),
        .init(name: "Family", description: "", color: .memorizeNavy, icon: "person.3", cards: []),
        .init(name: "Capital Cities", description: "", color: .memorizeOrange, icon: "house.lodge", cards: []),
        .init(name: "Weather", description: "", color: .memorizePurple, icon: "cloud.drizzle", cards: []),
        .init(name: "Civil War", description: "", color: .memorizeGreen, icon: "oar.2.crossed", cards: []),
        .init(name: "Holocaust", description: "", color: .memorizePink, icon: "flame", cards: []),
        .init(name: "Band History", description: "", color: .memorizeRed, icon: "guitars", cards: [])
    ]
}
