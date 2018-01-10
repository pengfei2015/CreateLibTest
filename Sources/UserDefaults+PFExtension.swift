//
//  UserDefaults+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

private let kKeyPrefix = "com.qufaya.qzzb."

extension UserDefaults {

    @discardableResult
    class func executeOnceWithShortKey(_ shortKey: Key, excute: () -> Void) -> Bool {
        let key = kKeyPrefix + shortKey
        if UserDefaults.standard.object(forKey: key) == nil {
            UserDefaults.standard.set(key, forKey: key)
            excute()
            return true
        } else {
            return false
        }
    }
    
    class func executePeriodic(with shortKey: Key, shortestIntervals: TimeInterval, excute: () -> Void) {
        let key = kKeyPrefix + shortKey
        let preTimeInterval = UserDefaults.standard.double(forKey: key)
        let nowTimeInterval = Date().timeIntervalSince1970
        if preTimeInterval + shortestIntervals <= nowTimeInterval {
            UserDefaults.standard.set(nowTimeInterval, forKey: key)
            excute()
        }
    }
}
