//
//  NewDeckSheet.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/14/23.
//

import SwiftUI

struct NewDeckSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var isEdit: Bool
    var deck: Deck?
    
    init(isEdit: Bool = false, deck: Deck? = nil) {
        self.isEdit = isEdit
        self.deck = deck
    }
    
    @State private var title = "New Deck"
    @State private var description = ""
    @State private var icon = "house"
    @State private var color = Color.memorizeBlue
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group {
                        if let deck {
                            DeckCell(for: deck)
                        } else {
                            DeckCell(withTitle: title, icon: icon, color: color)
                        }
                    }
                    .frame(maxWidth: 110)
                    .padding(.vertical)
                }
            }
            .navigationTitle(isEdit ? title : "New Deck")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
}

struct NewDeckSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckSheet(isEdit: false)
    }
}
