//
//  MemorizeBigButton.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct MemorizeBigButton: View {
    
    var title: LocalizedStringKey
    var role: MemorizeButtonRole
    var action: () -> Void
    
    init(_ title: LocalizedStringKey, role: MemorizeButtonRole = .primary, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
    
    enum MemorizeButtonRole {
        case primary, secondary
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.memorizeTitle4)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(15)
                .background(
                    role == .primary ?
                        LinearGradient(colors: [.accentColor, .accentColor.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        : LinearGradient(colors: [.secondary, .secondary.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    , in: RoundedRectangle(cornerRadius: 12)
                )
        }
        .buttonStyle(.plain)
    }
}

struct MemorizeBigButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MemorizeBigButton("Click Me", role: .secondary, action: { })
            
            MemorizeBigButton("Click Me", action: { })
        }
        .padding(.horizontal)
    }
}
