//
//  SettingsView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct SettingsRootView: View {
    
    @State private var isShowingProfileSheet = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingProfileSheet = true
                    } label: {
                        Label("Show Profile", systemImage: "person.circle")
                    }
                }
            }
            .sheet(isPresented: $isShowingProfileSheet) {
                ProfileSheet()
            }
        }
    }
}

struct SettingsRootView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRootView()
    }
}
