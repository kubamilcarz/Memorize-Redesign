//
//  ContentView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        MemorizeTabBarContainerView(selection: $vm.currentTab) {
            Text("hello")
                .tabBarItem(tab: .home, selection: $vm.currentTab)
            
            DecksRootView()
                .tabBarItem(tab: .decks, selection: $vm.currentTab)
            
            QuickReviewRootView()
                .tabBarItem(tab: .review, selection: $vm.currentTab)
            
            BrowseRootView()
                .tabBarItem(tab: .browse, selection: $vm.currentTab)
            
            SettingsRootView()
                .tabBarItem(tab: .settings, selection: $vm.currentTab)
        }
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
