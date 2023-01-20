//
//  MemorizeTabBarItem.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

enum MemorizeTabBarItem: Hashable {
    case home, decks, review, browse, settings
    
    var iconName: String {
        switch self {
        case .home: return "list.bullet.below.rectangle"
        case .decks: return "square.stack"
        case .browse: return "magnifyingglass"
        case .review: return "speedometer"
        case .settings: return "gear"
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .home: return "Home"
        case .decks: return "Decks"
        case .browse: return "Browse"
        case .review: return "Review"
        case .settings: return "Settings"
        }
    }
    
    var color: Color {
        .accentColor
    }
}
