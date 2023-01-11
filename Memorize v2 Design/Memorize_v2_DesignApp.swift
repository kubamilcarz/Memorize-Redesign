//
//  Memorize_v2_DesignApp.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

@main
struct Memorize_v2_DesignApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(descriptor: UIFontDescriptor(name: "Nunito-ExtraBold", size: 32).withSymbolicTraits(.traitBold)!, size: 32)]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(descriptor: UIFontDescriptor(name: "Nunito-Medium", size: 32).withSymbolicTraits(.traitBold)!, size: 17)]
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            OnboardingRootView()
        }
    }
}
