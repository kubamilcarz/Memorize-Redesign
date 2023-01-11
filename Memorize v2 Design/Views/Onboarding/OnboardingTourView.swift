//
//  OnboardingTourView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingTourView: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var body: some View {
        NavigationView {
            TabView(selection: $vm.currentTourPage) {
                ForEach(vm.tourPages) { page in
                    OnboardingTourCell(page)
                        .tabItem { Text(page.title) }
                        .tag(page.index)
                }
            }
            .frame(maxWidth: .infinity)
            .background(.background)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: vm.currentTourPage != .seven ? .always : .never))
            
            .navigationTitle("Memorize!")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            vm.currentPhase = .askForTour
                            vm.currentTourPage = .one
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                    }
                }
            }
        }
        
        .onDisappear {
            vm.currentTourPage = .one
        }
    }
}

struct OnboardingTourView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTourView()
            .environmentObject(OnboardingRootView.ViewModel())
    }
}
