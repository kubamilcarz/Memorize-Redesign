//
//  MemorizeBigButton.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct MemorizeBigButton: View {
    
    var title: LocalizedStringKey
    var icon: String?
    var role: MemorizeButtonRole
    var action: () -> Void
    
    init(_ title: LocalizedStringKey, role: MemorizeButtonRole = .primary, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
    
    init(_ title: LocalizedStringKey, icon: String, role: MemorizeButtonRole = .primary, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.role = role
        self.action = action
    }
    
    enum MemorizeButtonRole {
        case primary, secondary, tertiary, quaternary
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Group {
                ZStack {
                    if role != .quaternary {
                        Rectangle()
                            .fill(.background)
                            .frame(maxHeight: 60)
                    }
                    
                    if role == .primary {
                        LinearGradient(colors: [.accentColor, .accentColor.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(maxHeight: 60)
                    } else if role == .secondary {
                        LinearGradient(colors: [.secondary, .secondary.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(maxHeight: 60)
                    } else if role == .tertiary {
                        LinearGradient(colors: [.secondary.opacity(0.8), .secondary.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(maxHeight: 60)
                    }
                    
                    if role == .quaternary {
                        Rectangle().fill(.ultraThinMaterial)
                    }
                    
                    if let icon {
                        Label(title, systemImage: icon)
                            .padding(15)
                    } else {
                        Text(title)
                            .padding(15)
                    }
                }
                .font((role == .primary || role == .secondary) ? .memorizeTitle4 : role == .tertiary ? .memorizeBody : .memorizeBody2)
                .foregroundColor(role != .quaternary ? .white : .primary)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
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
