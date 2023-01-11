//
//  OnboardingIntroductionView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingIntroductionView: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 50) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Tell Us Something About Yourself")
                                .font(.memorizeTitle2)
                            Text("Pick your avatar, or upload your picture")
                                .font(.memorizeBody)
                        }
                        .padding(.horizontal)
                        
                        OnboardingAvatarPicker()
                            .padding(.vertical)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("And what's your name?")
                            .font(.memorizeBody)
                        
                        TextField("Jake", text: $vm.userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .padding(.bottom, 100)
            }
            .onTapGesture {
                self.hideKeyboard()
            }
            .navigationTitle("Memorize!")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        withAnimation {
                            vm.currentPhase = .start
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                    }
                }
            }
            
            .frame(maxWidth: .infinity)
            .background(.background)
        }
        
    }
}

struct OnboardingIntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingIntroductionView()
            .environmentObject(OnboardingRootView.ViewModel())
    }
}
