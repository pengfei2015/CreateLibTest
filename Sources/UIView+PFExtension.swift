//
//  UIView+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

// MARK: - 设置圆角
extension UIView {
    func setCornerRadius(_ radius: CGFloat, position: UIRectCorner = []) {
        if position == [] {
            layer.cornerRadius = radius
            layer.masksToBounds = true
            return
        }
        let rect = bounds
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: position, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
// MARK: - 点击
extension UIView {
    func addTapAction(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: target, action: action)
        tapGR.cancelsTouchesInView = false
        addGestureRecognizer(tapGR)
    }
}

// MARK: - 层次信息
extension UIView {
    /// 当前View所属的viewController
    var viewController: UIViewController? {
        for view in sequence(first: superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder is UIViewController {
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    /// 移除所有子试图
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}

// MARK: - 位置信息
extension UIView {
    var top: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    var bottom: CGFloat {
        set {
            frame.origin.y = newValue - height
        }
        get {
            return height + top
        }
    }
    var left: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    var right: CGFloat {
        set {
            frame.origin.x = newValue - width
        }
        get {
            return frame.origin.x + width
        }
    }
    var height: CGFloat {
        set {
            frame.size.height = newValue
        }
        get {
            return frame.size.height
        }
    }
    var width: CGFloat {
        set {
            frame.size.width = newValue
        }
        get {
            return frame.size.width
        }
    }
    var centerX: CGFloat {
        set {
            center.x = newValue
        }
        get {
            return center.x
        }
    }
    var centerY: CGFloat {
        set {
            center.y = newValue
        }
        get {
            return center.y
        }
    }
}
