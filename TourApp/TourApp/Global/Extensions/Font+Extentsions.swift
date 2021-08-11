//
//  Font+Extentsions.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/10/21.
//

import UIKit

enum FontType: Int {
    case regular
    case bold
    case italic
    case light
    case lightItalic
    case semiBold
    case boldItalic
    case black
    case extraBold
    case thin
    case medium
    case numberCustomFonts
    
    var fullName: String {
        switch self {
        case .regular:
            return " Core"
        case .bold:
            return "Core-Bold"
        case .italic:
            return " Core Italic"
        case .extraBold:
            return " Core ExtraBold"
        default:
            return " Core"
        }
    }
    
    var fullnameCustom: String {
        switch self {
        case .regular:
            return "-Regular"
        default:
            return "-Regular"
        }
    }
    
}

var kFontFamilyName = "HEINEKEN"
let kFontCustomName = "lsansuni"

extension UIFont {
    
    class func defaultAppFont(size sz: CGFloat, type: FontType) -> UIFont {
        return UIFont(
            name: kFontFamilyName.appending(type.fullName),
            size: sz) ?? UIFont.systemFont(ofSize: sz)
    }
    
    class func cunstomAppFont(size sz: CGFloat, type: FontType) -> UIFont {
        return UIFont(
            name: kFontCustomName.appending(type.fullnameCustom),
            size: sz) ?? UIFont.systemFont(ofSize: sz)
    }
}
