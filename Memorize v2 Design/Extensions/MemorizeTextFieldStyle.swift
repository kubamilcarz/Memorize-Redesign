//
//  MemorizeTextFieldStyle.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/17/23.
//

import SwiftUI

struct MemorizeTextFieldStyle: TextFieldStyle {
    let title: LocalizedStringKey?
    let systemImage: String?
    
    init(_ title: LocalizedStringKey? = nil, systemImage: String? = nil) {
        self.title = title
        self.systemImage = systemImage
    }
    
    // Hidden function to conform to this protocol
    func _body(configuration: TextField<Self._Label>) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title {
                Text(title)
                    .font(.memorizeTitle4)
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.regularMaterial, lineWidth: 2)
                    .frame(height: 50)
                
                HStack(spacing: 15) {
                    if let systemImage {
                        Image(systemName: systemImage)
                            .foregroundColor(.secondary)
                    }
                    
                    configuration
                        .foregroundColor(.primary)
                }
                .padding(.leading)
            }
        }
    }
}
