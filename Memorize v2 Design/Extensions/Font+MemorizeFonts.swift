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

    static let memorizeBody: Font = .custom("Nunito-Regular", size: 17, relativeTo: .body)

    static let memorizeBody2: Font = .custom("Nunito-Regular", size: 16, relativeTo: .body)

    static let memorizeCaption: Font = .custom("Nunito-Regular", size: 15, relativeTo: .caption)
    static let memorizeCaption2: Font = .custom("Nunito-Light", size: 13, relativeTo: .caption2)
    
    static let memorizeTabBar: Font = .custom("Nunnito-Regular", size: 11, relativeTo: .caption2).bold()
}

//extension Font {
//    public static var largeTitle: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
//    }
//
//    public static var title: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .title1).pointSize).bold()
//    }
//    
//    public static var title2: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .title2).pointSize)
//    }
//    
//    public static var title3: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize)
//    }
//    
//    public static var title4: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .title3).pointSize-2)
//    }
//
//    public static var headline: Font {
//        return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .headline).pointSize)
//    }
//
//    public static var subheadline: Font {
//        return Font.custom("Nunito-Light", size: UIFont.preferredFont(forTextStyle: .subheadline).pointSize)
//    }
//
//    public static var body: Font {
//       return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize)
//    }
//    
//    public static var body2: Font {
//       return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .body).pointSize-2)
//    }
//
//    public static var callout: Font {
//           return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .callout).pointSize)
//       }
//
//    public static var footnote: Font {
//           return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .footnote).pointSize)
//       }
//
//    public static var caption: Font {
//           return Font.custom("Nunito-Regular", size: UIFont.preferredFont(forTextStyle: .caption1).pointSize)
//       }
//
//    public static func system(memorize: Bool, size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> Font {
//        var font = "Nunito-Regular"
//        
//        switch weight {
//            case .bold: font = "Nunito-Bold"
//            case .heavy: font = "Nunito-ExtraBold"
//            case .light: font = "Nunito-Light"
//            case .medium: font = "Nunito-Regular"
//            case .semibold: font = "Nunito-SemiBold"
//            case .thin: font = "Nunito-Light"
//            case .ultraLight: font = "Nunito-Light"
//            default: break
//        }
//        
//        return Font.custom(font, size: size)
//    }
//}
