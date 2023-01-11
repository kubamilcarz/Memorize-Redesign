//
//  OnboardingViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

extension OnboardingRootView {
    final class ViewModel: ObservableObject {
        @Published var currentPhase: OnboardingPhase = .askForTour

        let avatars = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8"]
        
        @Published var userAvatar = "user3"
        @Published var userName = ""
    }
}

