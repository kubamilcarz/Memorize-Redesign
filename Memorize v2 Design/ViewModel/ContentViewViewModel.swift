//
//  ContentViewViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import Foundation

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var currentTab: MemorizeTabBarItem = .decks
        
        @Published var tabBarCollapseLevel: TabBarCollapseLevel = .medium
        
        enum TabBarCollapseLevel {
            case medium, high
        }
    }
}
