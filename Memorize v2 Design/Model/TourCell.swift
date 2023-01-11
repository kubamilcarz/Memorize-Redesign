//
//  TourCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct TourCell: Identifiable {
    let id = UUID()
    let title: LocalizedStringKey
    let body: LocalizedStringKey
    let image: String
    let index: OnboardingTourPhase
}
