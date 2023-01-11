//
//  OnboardingViewModel.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

extension OnboardingRootView {
    final class ViewModel: ObservableObject {
        @Published var currentPhase: OnboardingPhase = .tour
        @Published var currentTourPage: OnboardingTourPhase = .one

        let avatars = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8"]
        
        let tourPages: [TourCell] = [
            .init(title: "Decks Tab",
                  body: "To create a new deck tap Plus button in the top right corner.",
                  image: "onboardingTour1",
                  index: .one),
            .init(title: "New Deck",
                  body: "Here you can create a new deck, add description, choose icon or emoji, and pick accent color.",
                  image: "onboardingTour2",
                  index: .two),
            .init(title: "Creating First Flashcards",
                  body: "After you create a deck, click on to make your first card.",
                  image: "onboardingTour3",
                  index: .three),
            .init(title: "You’re Good To Study!",
                  body: "Now it’s time to study. Simply choose study mode and adjust settings if neccesary.",
                  image: "onboardingTour4",
                  index: .four),
            .init(title: "Get Instant Feedback",
                  body: "After each study session you get a summary, so you know how well you know the material.",
                  image: "onboardingTour5",
                  index: .five),
            .init(title: "Browse Tab",
                  body: "Manage your library from a single place. From there you can edit or remove cards, and add them to favorites.",
                  image: "onboardingTour6",
                  index: .six),
            .init(title: "Settings",
                  body: "In case you wanted to download or delete your data, you can do that from  Settings.",
                  image: "onboardingTour7",
                  index: .seven)
        ]
        
        @Published var userAvatar = "user3"
        @Published var userName = ""
    }
}

