//
//  DecksView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct DecksRootView: View {
    @StateObject var vm = ViewModel()
    
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    MemorizeBigButton("Custom Study", icon: "play", role: .tertiary) { }
                    MemorizeBigButton("New Deck", icon: "plus.circle", role: .tertiary) { }
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                DecksLayoutList()
                    .padding(.horizontal)
            }
            .navigationTitle("Decks")
            .searchable(text: $searchQuery, placement: .toolbar, prompt: Text("Browse Decks"))
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    decksSortingMenu
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    decksLayoutMenu
                }
            }
        }
        .environmentObject(vm)
        
    }
    
    private var decksSortingMenu: some View {
        Menu {
            Button { } label: {
                Label("Recent", systemImage: "clock")
            }
            
            Button { } label: {
                Label("Name", systemImage: "textformat")
            }
            
            Button { } label: {
                Label("Color", systemImage: "paintbrush")
            }
            
            Button { } label: {
                Label("Number of Cards", systemImage: "number")
            }
        } label: {
            Label("Sort Decks", systemImage: "arrow.up.arrow.down.circle")
        }
    }
    
    private var decksLayoutMenu: some View {
        Menu {
            Button { withAnimation { vm.changeLayout(to: .grid) } } label: {
                Label("Grid", systemImage: "rectangle.grid.3x2")
            }
            
            Button { withAnimation { vm.changeLayout(to: .list) } } label: {
                Label("List", systemImage: "rectangle.grid.1x2")
            }
            
            Button { withAnimation { vm.changeLayout(to: .collectionGrid) } } label: {
                Label("Collection Grid", systemImage: "square.grid.3x1.below.line.grid.1x2")
            }
            
            Button { withAnimation { vm.changeLayout(to: .collectionList) } } label: {
                Label("Collection List", systemImage: "list.bullet.below.rectangle")
            }
        } label: {
            Label("Adjust Layout", systemImage: "circle.grid.3x3.circle")
        }
    }
}

struct DecksRootView_Previews: PreviewProvider {
    static var previews: some View {
        DecksRootView()
    }
}
