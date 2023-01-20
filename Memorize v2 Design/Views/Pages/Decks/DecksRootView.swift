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
            GeometryReader { geom in
                ScrollView {
                    if Deck.dummy.isEmpty {
                        VStack {
                            MemorizeImage(.typewriter, width: 250)
                            Text("You haven’t created any decks yet. Tap button to create.")
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: 250)
                                .foregroundStyle(.secondary)
                            
                            Button {
                                vm.isShowingNewDeckSheet = true
                            } label: {
                                Text("New Deck")
                                    .padding(.horizontal, 7)
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .font(.memorizeBody)
                        .padding()
                        .frame(width: geom.size.width, height: geom.size.height)
                        .padding(.bottom, 70)

                    } else {
                        VStack(spacing: 10) {
                            HStack(spacing: 10) {
                                MemorizeBigButton("Custom Study", icon: "play", role: .quaternary) { }
                                MemorizeBigButton("New Deck", icon: "plus.circle", role: .quaternary) { vm.isShowingNewDeckSheet = true }
                            }
                            .padding(.horizontal)
                            
                            DecksLayoutList()
                                .padding(.horizontal)
                        }
                        .padding(.bottom, 70)

                    }
                }
            }
            
            .navigationTitle("Decks")
            .searchable(text: $searchQuery, placement: .toolbar, prompt: Text("Browse"))
            
            .toolbar {
                if !Deck.dummy.isEmpty {
                    ToolbarItem(placement: .navigationBarLeading) {
                        decksSortingMenu
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        decksLayoutMenu
                    }
                }
            }
            
            .sheet(isPresented: $vm.isShowingNewDeckSheet) {
                NewDeckSheet()
            }
            
            .sheet(item: $vm.editingDeck) { deck in
                NewDeckSheet(isEdit: true, deck: deck)
            }
            .pageInfoBar(icon: "square.stack", description: "Decks Tab Here", isShowing: .constant(true), dismiss: {} )
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
