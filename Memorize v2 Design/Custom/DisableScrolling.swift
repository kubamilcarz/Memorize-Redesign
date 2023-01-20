//
//  DisableScrolling.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct DisableScrolling: ViewModifier {
    var disabled: Bool
    
    func body(content: Content) -> some View {
    
        if disabled {
            content
                .simultaneousGesture(DragGesture(minimumDistance: 0), including: .subviews)
                .highPriorityGesture(DragGesture(minimumDistance: 0), including: .subviews)
        } else {
            content
        }
        
    }
}

extension View {
    func disableScrolling(disabled: Bool) -> some View {
        modifier(DisableScrolling(disabled: disabled))
    }
}
