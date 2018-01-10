//
//  Date+Extension.swift
//  Extensions
//
//  Created by 飞流 on 2017/11/10.
//  Copyright © 2017年 飞流. All rights reserved.
//

import UIKit

// MARK: - 日期的判断
extension Date {
    func isSameDay(as date: Date) -> Bool {
        return Calendar.current.isDate(self, inSameDayAs: date)
    }
    func isSameMonth(as date: Date) -> Bool {
        return firstDayOfCurrentMonth.isSameDay(as: date.firstDayOfCurrentMonth)
    }
    func isSameYear(as date: Date) -> Bool {
        return firstDayOfCurrentYear.isSameDay(as: date.firstDayOfCurrentYear)
    }
    func daysBetweenDate(_ date: Date) -> Int {
        let comp = Calendar.current.dateComponents([.day], from: self, to: date)
        return abs(comp.day ?? 0)
    }
}

// MARK: - 获取特定时间
extension Date {
    var zeroTimeStampDate: Date {
        let comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    var zeroTimeStamp: TimeInterval {
        return zeroTimeStampDate.timeIntervalSince1970
    }
    var firstDayOfCurrentMonth: Date {
        var comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        comp.day = 1
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    var firstDayOfCurrentYear: Date {
        var comp = Calendar.current.dateComponents([.year, .month, .day], from: self)
        comp.day = 1
        comp.month = 1
        if let date = Calendar.current.date(from: comp) {
            return date
        }
        return self
    }
    var mondayOfCurrentWeek: Date {
        if week == 1 {
            return intervalDays(-6).zeroTimeStampDate
        } else {
            let offset = 2 - week
            return intervalDays(offset).zeroTimeStampDate
        }
    }
    func intervalDays(_ days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    func intervalMonths(_ months: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.month = months
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
    func intervalYears(_ years: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = years
        guard let date = Calendar.current.date(byAdding: dateComponents, to: self) else {
            return self
        }
        return date
    }
}
// MARK: - 获取日期的特定属性
extension Date {
    /// 当前时间是否是12小时制
    var is12HourSystem: Bool {
        let dateStr = Date().description(with: Locale.current)
        return dateStr.contains(Calendar.current.amSymbol) || dateStr.contains(Calendar.current.pmSymbol)
    }
    var year: Int {
        return self.dateComponets.year ?? 0
    }
    var month: Int {
        return self.dateComponets.month ?? 0
    }
    var day: Int {
        return self.dateComponets.day ?? 0
    }
    var hour: Int {
        return self.dateComponets.hour ?? 0
    }
    var minute: Int {
        return self.dateComponets.minute ?? 0
    }
    var week: Int {
        return self.dateComponets.weekday ?? 0
    }
    var dateComponets: DateComponents {
        return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second, .weekday], from: self)
    }
}

/// 时间序列化
enum DateFormat: String {
    case MMddHHmm = "MM-dd HH:mm"
    case yyyyMMddHHmm = "yyyy-MM-dd HH:mm"
    case yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss"
    case yyyyMMdd = "yyyy.MM.dd"
    case ahmm = "ah:mm"
    case HHmm = "HH:mm"
    case HHmmss = "HH:mm:ss"
    case hmm = "h:mm"
    case EHHmm = "E HH:mm"
    case ddHHmm = "dd号 HH:mm"
}

extension Date {
    func string(withFormatString formatString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formatString
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
    func string(withFormat format: DateFormat) -> String {
        return string(withFormatString: format.rawValue)
    }
}



