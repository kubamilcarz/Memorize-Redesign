//
//  StudySessionModes.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct StudySessionModes: View {
    var deck: Deck
    
    init(for deck: Deck) {
        self.deck = deck
    }
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 10) {
                MemorizeBigButton("Flashcards", icon: "square.stack", role: .quaternary) { }
                MemorizeBigButton("Single Choice", icon: "checklist", role: .quaternary) { }
                
                trueOrFalseButton { }
            }
            .frame(maxWidth: .infinity)
            
            VStack(spacing: 10) {
                MemorizeBigButton("Test", icon: "note.text", role: .quaternary) { }
                MemorizeBigButton("Open Ended", icon: "rectangle.and.pencil.and.ellipsis", role: .quaternary) { }
                MemorizeBigButton("Custom", icon: "gear", role: .quaternary) { }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private func trueOrFalseButton(action: @escaping () -> Void) -> some View {
        Button { action() } label: {
            HStack {
                ZStack {
                    Image(systemName: "xmark.circle").opacity(0.5)
                        .padding([.leading, .top], -10)
                    Image(systemName: "checkmark.circle")
                }
                .padding(.top, 5)
                
                Text("True / False")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.memorizeBody)
        }
        .buttonStyle(.plain)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

struct StudySessionModes_Previews: PreviewProvider {
    static var previews: some View {
        StudySessionModes(for: Deck.dummy[0])
            .frame(height: 200)
    }
}
