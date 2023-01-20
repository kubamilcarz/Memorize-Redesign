//
//  MemorizeTabBarContainerView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct MemorizeTabBarContainerView<Content: View>: View {
    @Binding var selection: MemorizeTabBarItem
    let content: Content
    @State private var tabs: [MemorizeTabBarItem] = []
    
    init(selection: Binding<MemorizeTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea(edges: .bottom)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            MemorizeTabBarView(tabs: tabs, selection: $selection)
                .padding(.bottom, UIDevice.current.hasNotch ? 0 : 15)
                .ignoresSafeArea(edges: .bottom)
        }
        .onPreferenceChange(MemorizeTabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}
