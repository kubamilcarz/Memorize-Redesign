//
//  OnboardingPhase.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import Foundation

enum OnboardingPhase {
    case start, introduction, askForTour, tour, end
}

enum OnboardingTourPhase: Int {
    case one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7
}
