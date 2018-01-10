//
//  CollectionType+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

extension Collection {
    func mergeIntoSections(_ canMergeTogether: (Self.Iterator.Element, Self.Iterator.Element) -> Bool) -> [[Self.Iterator.Element]] {
        var sections: [[Self.Iterator.Element]] = []
        self.forEach { element in
            var index: Int?
            sections.enumerated().forEach { i, e in
                if canMergeTogether(e.first!, element) {
                    index = i
                    return
                }
            }
            if let i = index {
                var section = sections.remove(at: i)
                section.append(element)
                sections.insert(section, at: i)
            } else {
                sections.append([element])
            }
        }
        return sections
    }
}
