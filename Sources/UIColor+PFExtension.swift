//
//  UIColor+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init(hex hexValue: Int, alpha: CGFloat = 1) {
        let red = (CGFloat((hexValue & 0xFF0000) >> 16)) / 255
        let green = (CGFloat((hexValue & 0xFF00) >> 8)) / 255
        let blue = (CGFloat(hexValue & 0xFF)) / 255
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hexString str: String, alpha: CGFloat = 1) {
        var hex = str
        if str.hasPrefix("0x") {
            hex = str[str.index(str.startIndex, offsetBy: 2)...].string
        }
        self.init(hex: Int(hex, radix: 16) ?? 0)
    }
}

extension UIColor {
    func toImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        set()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
