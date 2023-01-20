//
//  Card.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var front: String
    var back: String
    var isHard: Bool
    var isFavorite: Bool
    
    static let dummy: [Card] = [
        .init(front: "Tener", back: "To have", isHard: false, isFavorite: true),
        .init(front: "Beber", back: "To drink", isHard: false, isFavorite: true),
        .init(front: "Comer", back: "To eat", isHard: true, isFavorite: true),
        .init(front: "Dormir", back: "To sleep", isHard: false, isFavorite: true),
        .init(front: "Ir", back: "To walk", isHard: false, isFavorite: true),
        .init(front: "Trabajar", back: "To work", isHard: true, isFavorite: true),
        .init(front: "Leventarse", back: "To wake up", isHard: false, isFavorite: false),
        .init(front: "Acostarse", back: "To go to sleep", isHard: false, isFavorite: false),
        .init(front: "Desayunar", back: "To have dinner", isHard: true, isFavorite: false),
        .init(front: "Salir", back: "To go out", isHard: false, isFavorite: false),
        .init(front: "Volver", back: "To come back", isHard: false, isFavorite: false),
        .init(front: "Jugar", back: "To play", isHard: true, isFavorite: false),
        .init(front: "Estar", back: "To be", isHard: false, isFavorite: false),
        .init(front: "Cantar", back: "To sing", isHard: true, isFavorite: false),
        .init(front: "Tomar", back: "To take", isHard: false, isFavorite: false),
        .init(front: "Poder", back: "To be able to", isHard: true, isFavorite: false),
    ]
}
