//
//  NotFoundOverlay.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

enum NotFoundItem {
    case deck, card
}

struct NotFoundOverlayContainer: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    var isActive: Bool
    var item: NotFoundItem
    
    var title: LocalizedStringKey {
        switch item {
        case .deck:
            return "Deck Not Found"
        case .card:
            return "Card Not Found"
        }
    }
    
    var message: LocalizedStringKey = "We tried, but we couldn’t find what you were looking for."
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isActive {
                Rectangle().fill(.ultraThinMaterial).ignoresSafeArea()
                
                VStack(spacing: 5) {
                    MemorizeImage(.catalog, width: 200)
                        .padding(.bottom, 10)
                    
                    Text(title)
                        .font(.memorizeTitle3)
                    
                    Text(message)
                        .font(.memorizeCaption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Button(action: { dismiss() }) {
                        Label("Go Back", systemImage: "arrow.left")
                            .font(.memorizeCaption)
                    }
                    .padding(.top, 15)
                    .tint(.secondary)
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: 200)
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.background)
                        .shadow(color: .black.opacity(0.3), radius: 8)
                )
            }
        }
    }
}

struct NotFoundOverlayContainer_Previews: PreviewProvider {
    static var previews: some View {
        DeckDetailView(deck: Deck.dummy[0])
            .environmentObject(DecksRootView.ViewModel())
            .notFoundOverlay(isActive: true, for: .deck)
    }
}


extension View {
    func notFoundOverlay(isActive: Bool, for item: NotFoundItem) -> some View {
        modifier(NotFoundOverlayContainer(isActive: isActive, item: item))
    }
}

