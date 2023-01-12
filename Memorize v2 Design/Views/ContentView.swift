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
        TabView(selection: $vm.currentTab) {
            DecksRootView()
                .tabItem {
                    Label("Decks", systemImage: "square.stack")
                }
                .tag(MemorizeTab.decks)
            BrowseRootView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
                .tag(MemorizeTab.browse)
            QuickReviewRootView()
                .tabItem {
                    Label("Review", systemImage: "speedometer")
                }
                .tag(MemorizeTab.review)
            SettingsRootView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(MemorizeTab.settings)
        }
        .tabViewStyle(.automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
