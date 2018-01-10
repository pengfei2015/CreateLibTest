//
//  UIScreen+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

let isX = UIScreen.main.bounds.height == 812

extension UIScreen {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let bottomEdge = isX ? 34 : 0
    static let topBarHeight = isX ? 44 : 20
    static let navBarBottom = isX ? 88 : 64
}
