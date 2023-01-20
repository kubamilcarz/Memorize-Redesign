//
//  MemorizeTabBarPreferenceKey.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import Foundation
import SwiftUI

struct MemorizeTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [MemorizeTabBarItem] = []
    
    static func reduce(value: inout [MemorizeTabBarItem], nextValue: () -> [MemorizeTabBarItem]) {
        value += nextValue()
    }
    
}

struct MemorizeTabBarItemViewModifier: ViewModifier {
    
    let tab: MemorizeTabBarItem
    @Binding var selection: MemorizeTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: MemorizeTabBarItemsPreferenceKey.self, value: [tab])
    }
    
}

extension View {
    func tabBarItem(tab: MemorizeTabBarItem, selection: Binding<MemorizeTabBarItem>) -> some View {
        modifier(MemorizeTabBarItemViewModifier(tab: tab, selection: selection))
    }
}
