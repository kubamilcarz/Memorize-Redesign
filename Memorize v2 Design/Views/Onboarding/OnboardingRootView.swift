//
//  OnboardingRootView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingRootView: View {
    @StateObject var vm = ViewModel()
    
    @AppStorage("isOnboardingCompleted") var isOnboardingCompleted = false
    
    var body: some View {
        VStack {
            switch vm.currentPhase {
            case .start:
                OnboardingHelloView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case .introduction:
                OnboardingIntroductionView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case .askForTour:
                OnboardingAskForTourView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case .tour:
                OnboardingTourView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
            case .end:
                OnboardingSummaryView()
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
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
                        if vm.currentTourPage == .seven {
                            MemorizeBigButton("Finish Tour") {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    vm.currentPhase = .end
                                }
                            }
                        }
                    }
                case .end:
                    MemorizeBigButton("Finish") {
                        withAnimation(.easeInOut(duration: 2)) {
                            isOnboardingCompleted = true
                        }
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
