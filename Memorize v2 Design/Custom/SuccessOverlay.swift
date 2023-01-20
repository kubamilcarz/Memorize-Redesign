//
//  SuccessOverlay.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

import SwiftUI

struct SuccessOverlayView: ViewModifier {
    @Binding var animated: Bool
    
    let message: LocalizedStringKey
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack(spacing: 15) {
                Image(systemName: "plus")
                    .font(.system(size: 70))
                Text(message)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.secondary)
            .padding()
            .frame(width: 170, height: 170)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
            .opacity(animated ? 1 : 0)
            
            .onChange(of: animated) { _ in
                withAnimation {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                        withAnimation {
                            animated = false
                        }
                    }
                }
            }
        }
    }
}

extension View {
    func withSuccessOverlay(_ title: LocalizedStringKey, animated: Binding<Bool>) -> some View {
        modifier(SuccessOverlayView(animated: animated, message: title))
    }
}

