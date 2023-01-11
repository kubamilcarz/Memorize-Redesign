//
//  OnboardingTourCell.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingTourCell: View {
    @EnvironmentObject var vm: OnboardingRootView.ViewModel
    
    var tour: TourCell
    
    init(_ cell: TourCell) {
        self.tour = cell
    }
    
    var body: some View {
        GeometryReader { geom in
            ScrollView {
                VStack(spacing: 15) {
                    Image(tour.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geom.size.width * 0.65)
                    
                    VStack {
                        Text(tour.title)
                            .font(.memorizeTitle3Bold)
                            .lineLimit(2)
                        
                        Text(tour.body)
                            .font(.memorizeBody)
                            .lineLimit(3)
                            .frame(maxWidth: 320)
                    }
                    .multilineTextAlignment(.center)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .padding()
                .frame(width: geom.size.width, height: geom.size.height)
            }
        }
    }
}

struct OnboardingTourCell_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTourCell(TourCell(title: "", body: "", image: "", index: .one))
    }
}
