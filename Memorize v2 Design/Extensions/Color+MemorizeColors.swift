//
//  Color+MemorizeColors.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/12/23.
//

import SwiftUI

extension Color {
    
    // MARK: - Memorize Colors
    static let memorizeRed = Self.init(hex: "e03524")
    static let memorizeOrange = Self.init(hex: "f07c12")
    static let memorizeYellow = Self.init(hex: "f9cb40")
    static let memorizeGreen = Self.init(hex: "21b534")
    static let memorizeMint = Self.init(hex: "3bceac")
    static let memorizeBlue = Self.init(hex: "0077b6")
    static let memorizeNavy = Self.init(hex: "1f64ad")
    static let memorizePurple = Self.init(hex: "903498")
    
    static let memorizePink = Self.init(hex: "e0516d")
    static let memorizeGray = Self.init(hex: "303036")
    
    
    // MARK: - Hex Extension
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
