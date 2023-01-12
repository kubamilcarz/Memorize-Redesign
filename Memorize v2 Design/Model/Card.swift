//
//  Card.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID()
    var front: String
    var back: String
    var isHard: Bool
    var isFavorite: Bool
}
