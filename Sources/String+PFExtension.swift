//
//  String+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

// MARK: - Substring
extension Substring {
    var string: String {
        return String(self)
    }
}

extension String {
    func toUrl() -> URL? {
        return URL(string: self)
    }
}

extension String {
    func stringByRemoveWhitespaceAndNewLine() -> String {
        var string = replacingOccurrences(of: " ", with: "")
        string = string.replacingOccurrences(of: "\r", with: "")
        string = string.replacingOccurrences(of: "\n", with: "")
        return string
    }
    func stringByTrimmingTailCharactersInSet(_ set: CharacterSet) -> String {
        var utf16View: String.UTF16View = utf16
        for uchar in utf16.reversed() {
            if set.contains(UnicodeScalar(uchar)!) {
                utf16View = String(Substring(utf16View.dropLast())).utf16
            } else {
                break
            }
        }
        return String(describing: utf16View)
    }
    /// 删除特殊字符
    func stringByRemovePunctuation() -> String {
        let regex = try? NSRegularExpression(pattern: "[\\p{Punct}\\p{Space}]+", options: .caseInsensitive)
        return regex?.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: count), withTemplate: "") ?? ""
    }
}
extension String {
    // 向上取整，避免layout设置宽的时候出现问题，
    func width(with font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    func height(with font: UIFont, and width: Width = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        return ceil(boundingBox.height)
    }
}


