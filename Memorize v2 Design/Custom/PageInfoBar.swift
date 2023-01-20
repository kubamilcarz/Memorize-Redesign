//
//  PageInfoBar.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct PageInfoBar: ViewModifier {
    @EnvironmentObject var contentVM: ContentView.ViewModel
    
    var icon: String
    var description: LocalizedStringKey
    @Binding var isShowing: Bool
    var dismiss: () -> Void
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            
            if isShowing {
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.accentColor)
                        .font(.title)
                    Text(description)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                    Spacer()
                    Button { withAnimation { dismiss() } } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary.opacity(0.8))
                            .font(.body)
                    }
                }
                .padding()
                .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
                .offset(x: 0, y: contentVM.currentTab != .review ? ( contentVM.tabBarCollapseLevel == .medium ? -70 : -34) : ( contentVM.tabBarCollapseLevel == .medium ? -105 : -60))
                .padding(.horizontal, 10)
            }
        }
    }
}

extension View {
    func pageInfoBar(icon: String, description: LocalizedStringKey, isShowing: Binding<Bool>, dismiss: @escaping () -> Void) -> some View {
        modifier(PageInfoBar(icon: icon, description: description, isShowing: isShowing) {
            withAnimation {
                dismiss()
            }
        })
    }
}
