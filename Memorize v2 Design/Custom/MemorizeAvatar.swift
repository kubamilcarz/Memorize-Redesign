//
//  MemorizeAvatar.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct MemorizeAvatar: View {
    
    var image: String
    var width: CGFloat
    var isCircular: Bool
    
    init(_ image: String, width: CGFloat = 70, isCircular: Bool = true) {
        self.image = image
        self.width = width
        self.isCircular = isCircular
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: width, height: width)
            .scaledToFill()
            .clipShape(RoundedRectangle(cornerRadius: isCircular ? width : 12))
    }
}

struct MemorizeAvatar_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeAvatar("user1")
    }
}
