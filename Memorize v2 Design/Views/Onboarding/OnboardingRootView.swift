//
//  OnboardingRootView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingRootView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            switch vm.currentPhase {
            case .start:
                OnboardingHelloView()
                    .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
            case .introduction:
                OnboardingIntroductionView()
                    .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
            case .askForTour:
                OnboardingAskForTourView()
                    .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
            case .tour:
                OnboardingTourView()
                    .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
            case .end:
                OnboardingSummaryView()
                    .transition(.asymmetric(insertion: .push(from: .trailing), removal: .push(from: .leading)))
            }
        }
        .environmentObject(vm)
        .withFloatingActionButtons {
            VStack {
                switch vm.currentPhase {
                case .start:
                    MemorizeBigButton("Continue") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            vm.currentPhase = .introduction
                        }
                    }
                case .introduction:
                    MemorizeBigButton("Continue") {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            vm.currentPhase = .askForTour
                        }
                    }
                    .disabled(vm.userName.isEmpty)
                case .askForTour:
                    VStack {
                        MemorizeBigButton("Continue to Tour") {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                vm.currentPhase = .tour
                            }
                        }
                        MemorizeBigButton("Skip Tour", role: .secondary) {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                vm.currentPhase = .end
                            }
                        }
                    }
                case .tour:
                    VStack {
                        
                    }
                case .end:
                    MemorizeBigButton("Finish") {
                        
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct OnboardingRootView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRootView()
    }
}
