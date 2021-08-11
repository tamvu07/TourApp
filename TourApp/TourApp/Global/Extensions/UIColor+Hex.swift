//
//  UIColor+Hex.swift
//  TourApp
//
//  Created by Vu Minh Tam on 8/10/21.
//

import UIKit

let kColorPrimary: UInt32 = 0x008742//0x0D8D4C
let kColorLightPrimary: UInt32 = 0x8CC73F
let kColorTintTabTar: UInt32 = 0xe0e8ec
let kColorBackgroundScreen: UInt32 = 0xeaf1f4
let kColorMainText: UInt32 = 0x30445c
let kColorDetailText: UInt32 = 0x96aabb
let kColorDetailCyanText: UInt32 = 0x23C0FF
let kColorBorder: UInt32 = 0xB9C6D0
let kColorDarkMainText: UInt32 = 0x393939
let kColorDarkDetailText: UInt32 = 0x4A4A4A
let kColorLightGrayBackgroud: UInt32 = 0xF3F3F3

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    public convenience init(netHex: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((netHex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((netHex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( netHex & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

extension UIColor {
    func returnImageWithSize(_ size: CGSize)-> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        self.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

