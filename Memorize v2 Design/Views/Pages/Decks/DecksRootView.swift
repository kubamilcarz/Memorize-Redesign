//
//  DecksView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct DecksRootView: View {
    
    var body: some View {
        NavigationView {
            DecksLayoutList()
        }
        .navigationTitle("Decks")
    }
}

struct DecksRootView_Previews: PreviewProvider {
    static var previews: some View {
        DecksRootView()
    }
}
