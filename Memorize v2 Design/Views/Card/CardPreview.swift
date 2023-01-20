//
//  CardPreview.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct CardPreview: View {
    @EnvironmentObject var contentVM: ContentView.ViewModel
    
    var card: Card
    
    @State private var isShowingEditSheet = false
    
    init(for card: Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geom in
            ScrollView {
                VStack {
                    // Flashcard preview
                    Spacer()
                    
                    NavigationLink {
                        CardDetailView(card: card)
                    } label: {
                        Text("More Info")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .font(.memorizeTitle4)
                            .foregroundStyle(.white)
                            .background(Color.accentColor, in: RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal)
                .frame(width: geom.size.width, height: geom.size.height-70+(contentVM.tabBarCollapseLevel == .high ? 45 : 0))
            }
        }
        .navigationTitle(card.front)
        .navigationBarTitleDisplayMode(.inline)
        .notFoundOverlay(isActive: false, for: .card)
        .toolbar {
            Button { isShowingEditSheet = true } label: {
                Text("Edit").font(.memorizeBody)
            }
        }
        .sheet(isPresented: $isShowingEditSheet) {
            NewCardView(card: card, isNested: false)
        }
    }
}

struct CardPreview_Previews: PreviewProvider {
    static var previews: some View {
        CardPreview(for: Card.dummy[0])
    }
}
