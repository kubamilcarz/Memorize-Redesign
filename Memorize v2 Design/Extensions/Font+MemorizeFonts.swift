//
//  Font+MemorizeFonts.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/11/23.
//

import SwiftUI

extension Font {
    
    static let memorizeTitle: Font = .custom("Nunito-Bold", size: 37, relativeTo: .title)
    static let memorizeTitle2: Font = .custom("Nunito-Bold", size: 33, relativeTo: .title2)
    static let memorizeTitle3: Font = .custom("Nunito-SemiBold", size: 21, relativeTo: .title3)
    static let memorizeTitle3Bold: Font = .custom("Nunito-Bold", size: 21, relativeTo: .title3)
    
    static let memorizeTitle4: Font = .custom("Nunito-SemiBold", size: 19, relativeTo: .title3)
    
    static let memorizeBody: Font = .custom("Nunito-regular", size: 17, relativeTo: .body)
    
    static let memorizeCaption: Font = .custom("Nunito-regular", size: 15, relativeTo: .caption)
    static let memorizeCaption2: Font = .custom("Nunito-Light", size: 13, relativeTo: .caption2)
}
