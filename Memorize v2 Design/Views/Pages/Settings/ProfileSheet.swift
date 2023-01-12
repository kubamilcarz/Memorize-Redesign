//
//  ProfileSheet.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct ProfileSheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                Button("Done") {
                    dismiss()
                }
                .font(.memorizeBody)
            }
        }
    }
}

struct ProfileSheet_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSheet()
    }
}
