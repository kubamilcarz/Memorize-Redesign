//
//  QuickReviewView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct QuickReviewRootView: View {
    @EnvironmentObject var contentVM: ContentView.ViewModel
    
    var body: some View {
        ScrollView {
            
        }
        .onChange(of: contentVM.currentTab) { newTab in
            if newTab == .review {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 25)) {
                        contentVM.tabBarCollapseLevel = .high
                    }
                }
            }
        }
        .pageInfoBar(icon: "speedometer", description: "Review Tab here", isShowing: .constant(true), dismiss: { })
    }
}

struct QuickReviewRootView_Previews: PreviewProvider {
    static var previews: some View {
        QuickReviewRootView()
    }
}
