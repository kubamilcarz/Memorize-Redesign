//
//  MemorizeImage.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

struct MemorizeImage: View {
    @Environment(\.colorScheme) var colorScheme
    
    var image: String
    
    var width: CGFloat?
    var height: CGFloat?

    init(_ graphic: MemorizeGraphics, width: CGFloat?) {
        self.image = graphic.rawValue
        self.width = width
    }
    
    init(_ graphic: MemorizeGraphics, height: CGFloat?) {
        self.image = graphic.rawValue
        self.height = height
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: width, maxHeight: height)
            .opacity(colorScheme == .light ? 1 : 0.95)
    }
}

struct MemorizeImage_Previews: PreviewProvider {
    static var previews: some View {
        MemorizeImage(.girlLaptopIdeas, width: 300)
    }
}
