//
//  UILabel+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

extension UILabel {
    // 设置字间距
    @discardableResult
    func setWordSpace(_ space: Float) -> Bool {
        guard let attributedText = attributedText else { return false }
        let attText = NSMutableAttributedString(attributedString: attributedText)
        attText.addAttribute(NSAttributedStringKey.kern, value: space, range: NSRange(location: 0, length: attributedText.length))
        self.attributedText = attText
        return true
    }
    // 设置关键字
    @discardableResult
    func setKeywords(_ keywords: [String], font: UIFont) -> Bool {
        guard let attributedText = attributedText else { return false }
        let text = NSMutableAttributedString(attributedString: attributedText)
        keywords.forEach {
            let range = ((self.text ?? "") as NSString).range(of: $0)
            text.addAttributes([NSAttributedStringKey.font: font], range: range)
        }
        return true
    }
    @discardableResult
    func setKeywords(_ keywords: [String], color: UIColor) -> Bool {
        guard let attributedText = attributedText else { return false }
        let text = NSMutableAttributedString(attributedString: attributedText)
        keywords.forEach {
            let range = ((self.text ?? "") as NSString).range(of: $0)
            text.addAttributes([NSAttributedStringKey.foregroundColor: color], range: range)
        }
        return true
    }
    @discardableResult
    func setKeywords(_ keywords: [String], backgroundColor: UIColor) -> Bool {
        guard let attributedText = attributedText else { return false }
        let text = NSMutableAttributedString(attributedString: attributedText)
        keywords.forEach {
            let range = ((self.text ?? "") as NSString).range(of: $0)
            text.addAttributes([NSAttributedStringKey.backgroundColor: backgroundColor], range: range)
        }
        return true
    }
}
