//
//  OnboardingHelloView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct OnboardingHelloView: View {

    var body: some View {
        GeometryReader { geom in
            ScrollView(.vertical) {
                VStack {
                    Spacer()
                    Spacer()
                    
                    MemorizeImage(.journeyBeginning, width: geom.size.width - 50)
                    
                    VStack(spacing: 15) {
                        Text("Hi, Welcome")
                            .font(.memorizeTitle)
                        
                        Text("Memorize! lets you study easier, smarter, and hit your goals faster.")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: 300)
                            .font(.memorizeBody)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
                .frame(width: geom.size.width)
                .frame(minHeight: geom.size.height)
            }
        }
        .frame(maxWidth: .infinity)
        .background(.background)
    }
}

struct OnboardingHelloView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingHelloView()
    }
}
