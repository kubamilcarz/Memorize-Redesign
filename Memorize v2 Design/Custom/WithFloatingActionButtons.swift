//
//  WithFloatingActionButtons.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct FloatingActionButtonContainer<T: View>: ViewModifier {
    var buttons: T
    
    init(@ViewBuilder buttons: () -> T) {
        self.buttons = buttons()
    }
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            buttons
        }
    }
}

extension View {
    func withFloatingActionButtons(@ViewBuilder buttons: () -> some View) -> some View {
        modifier(FloatingActionButtonContainer(buttons: buttons))
    }
}
