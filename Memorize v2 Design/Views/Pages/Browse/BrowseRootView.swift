//
//  BrowseView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct BrowseRootView: View {
    @StateObject var vm: ViewModel
    
    init(cards: [Card]? = nil) {
        if let cards {
            _vm = StateObject(wrappedValue: ViewModel(cards: cards))
        } else {
            // get from fetch request (for now like this)
            _vm = StateObject(wrappedValue: ViewModel(cards: Card.dummy))
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                CardsList(with: vm.cards)
                    .padding(.bottom, 70)

            }
            .navigationTitle("Browse")

            .searchable(text: $vm.searchQuery, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("Search"))
            .pageInfoBar(icon: "magnifyingglass", description: "Browse Tab here", isShowing: .constant(true), dismiss: { })
        }
    }
}

struct BrowseRootView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseRootView(cards: Card.dummy)
    }
}
