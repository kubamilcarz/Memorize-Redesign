//
//  OnboardingAvatarPicker.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingAvatarPicker: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 15) {
                    Rectangle().fill(.clear)
                        .frame(width: 150)
                    
                    ForEach(vm.avatars, id: \.self) { avatar in
                        MemorizeAvatar(avatar, width: avatar == vm.userAvatar ? 140 : 90)
                            .id(avatar)
                            .onTapGesture {
                                withAnimation {
                                    vm.userAvatar = avatar
                                }
                            }
                    }
                    
                    Rectangle().fill(.clear)
                        .frame(width: 150)
                }
                .onAppear {
                    scrollView.scrollTo(vm.userAvatar, anchor: .center)
                }
                .onChange(of: vm.userAvatar) { newAvatar in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            scrollView.scrollTo(newAvatar, anchor: .center)
                        }
                    }
                }
            }
        }
    }
}

struct OnboardingAvatarPicker_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingAvatarPicker()
            .environmentObject(OnboardingRootView.ViewModel())
    }
}
