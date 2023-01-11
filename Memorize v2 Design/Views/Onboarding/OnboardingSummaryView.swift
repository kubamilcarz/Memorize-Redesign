//
//  OnboardingSummaryView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingSummaryView: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                MemorizeImage(.superhumansFlyingUp, width: .infinity)
                
                Text("Happy Studying!")
                    .font(.memorizeTitle)
                
                Button("Reset") {
                    vm.currentPhase = .start
                }
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.background)
    }
}

struct OnboardingSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSummaryView()
    }
}
