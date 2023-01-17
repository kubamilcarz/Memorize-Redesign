//
//  MemorizeCapsuleButton.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/13/23.
//

import SwiftUI

struct MemorizeCapsuleButton: View {
    
    var title: LocalizedStringKey
    var action: () -> Void
    
    init(_ title: LocalizedStringKey, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
                .foregroundColor(.white)
                .background(Color.accentColor, in: Capsule())
        }
        .buttonStyle(.plain)
        .font(.memorizeCaption2)
    }
}

struct MemorizeCapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeCapsuleButton("Click me") { }
    }
}
