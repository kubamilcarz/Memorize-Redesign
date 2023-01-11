//
//  OnboardingAskForTourView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingAskForTourView: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    MemorizeImage(.girlReadingStackBooks, width: .infinity)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Hi, \(vm.userName)!")
                            .font(.memorizeTitle2)
                        
                        Text("Before you jump into Memorize! would you like to take a quick tour?")
                            .padding(.trailing, 50)
                            .font(.memorizeBody)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(.background)
            
            .navigationTitle("Memorize!")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            vm.currentPhase = .introduction
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                    }
                }
            }
        }
    }
}

struct OnboardingAskForTourView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingAskForTourView()
            .environmentObject(OnboardingRootView.ViewModel())
    }
}
