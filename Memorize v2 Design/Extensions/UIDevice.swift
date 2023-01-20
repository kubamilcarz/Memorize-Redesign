//
//  UIDevice.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import UIKit

extension UIDevice {
    static var isiPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isiPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
