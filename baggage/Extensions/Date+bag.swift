//
//  Date+bag.swift
//  baggage
//
//  Created by Nicolas Palmieri on 12/20/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import Foundation

extension Date {

    @nonobjc static let calendar: Calendar = Date.getUTCCalendar()

    fileprivate static func getUTCCalendar() -> Calendar {
        var calendar: Calendar = Calendar.autoupdatingCurrent
        calendar.timeZone = TimeZone(identifier: "UTC")!
        return calendar
    }

    // MARK: - Date Formatters

    static func getISODateFormatter() -> DateFormatter {
        return getDateFormatter("dd-MM-yyyy")
    }

    static func getMM_yyyyDateFormatter() -> DateFormatter {
        return getDateFormatter("MM/yyyy")
    }

    static func getMM_dd_yyyyDateFormatter() -> DateFormatter {
        return getDateFormatter("MM/dd/yyyy")
    }

    static func getyyyy_MMDateFormatter() -> DateFormatter {
        return getDateFormatter("yyyy-MM")
    }

    static func getMssqlDateFormatter() -> DateFormatter {
        return getDateFormatter("yyyy-MM-dd'T'HH:mm:ssZ")
    }

    static func getMssqlTTDateFormatter() -> DateFormatter {
        return getDateFormatter("yyyy-MM-dd'T'HH:mm:ss.S'T'Z")
    }

    static func getMMM_ddDateFormatter() -> DateFormatter {
        return getDateFormatter("MMM dd")
    }

    static func getMMM_dd_yyyyDateFormatter() -> DateFormatter {
        return getDateFormatter("MMM dd, yyyy")
    }

    static func getMM_ddDateFormatter() -> DateFormatter {
        return getDateFormatter("MM/dd")
    }

    static func getDateFormatter(_ format: String) -> DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = calendar.timeZone
        return dateFormatter
    }

    // MARK: - Date modifiers

    static func getDate(_ year: Int, month: Int, day: Int) -> Date {
        var dateComponents: DateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return Date.calendar.date(from: dateComponents)!
    }

    static func dateWithDaysFromToday(_ days: Int) -> Date {
        let calendar: Calendar = Calendar.current
        let dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: Date())
        let date: Date = calendar.date(from: dateComponents)!
        return (calendar as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: days, to: date, options: NSCalendar.Options.matchFirst)!
    }

    static func dateWithDaysFromDate(_ days: Int, fromDate: Date) -> Date {
        let calendar: Calendar = Calendar.current
        let dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: fromDate)
        let date: Date = calendar.date(from: dateComponents)!
        return (calendar as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: days, to: date, options: NSCalendar.Options.matchFirst)!
    }

    static func getCurrentFormatterDate() -> Date {
        let currentDate: Date = Date()
        let calendar: Calendar = Calendar.current
        let dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: currentDate)
        return calendar.date(from: dateComponents)!
    }

    static func getOneYearAgoDate() -> Date {
        let currentDate: Date = Date()
        let calendar: Calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        var dateComponents: DateComponents = DateComponents()
        dateComponents.year = -1
        return (calendar as NSCalendar).date(byAdding: dateComponents, to: currentDate, options: NSCalendar.Options.matchFirst)!
    }

    func getDateWithoutTime() -> Date {
        let dateComponents: DateComponents = (Date.calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: self)
        return Date.getDate(dateComponents.year!, month: dateComponents.month!, day: dateComponents.day!)
    }

    func numberOfDaysSinceDate(_ date: Date) -> Int {
        let dateComponents: DateComponents = (Date.calendar as NSCalendar).components(NSCalendar.Unit.day, from: date.getDateWithoutTime(), to: self.getDateWithoutTime(), options: NSCalendar.Options.wrapComponents)
        return dateComponents.day!
    }

    func numberOfWeeksSinceDate(_ date: Date) -> Int {
        let numberOfDays: Double = Double(self.numberOfDaysSinceDate(date)) / 7
        return Int(round(numberOfDays))
    }

    func dateByAddingWeeks(_ numberOfWeeks: Int) -> Date {
        var dateComponents: DateComponents = DateComponents()
        dateComponents.weekOfYear = numberOfWeeks
        let futureDate: Date = (Date.calendar as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options.wrapComponents)!
        return futureDate.getDateWithoutTime()
    }

    func dateByAddingDays(_ days: Int) -> Date {
        let calendar: Calendar = Calendar.current
        return (calendar as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: days, to: self, options: NSCalendar.Options.matchFirst)!
    }

    func thirtyDaysAfterDate() -> Date {
        var dateComponents: DateComponents = DateComponents()
        dateComponents.day = 30
        let calendar: Calendar = Calendar.current
        return (calendar as NSCalendar).date(byAdding: dateComponents, to: self, options: NSCalendar.Options.matchFirst)!
    }

    func endOfDayDate() -> Date {
        let calendar: Calendar = Calendar.current
        var dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: self)
        dateComponents.hour = 23
        dateComponents.minute = 59
        dateComponents.second = 59
        return calendar.date(from: dateComponents)!
    }

    func startOfDayDate() -> Date {
        let calendar: Calendar = Calendar.current
        var dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: self)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        return calendar.date(from: dateComponents)!
    }

    // MARK: - Date strings

    static func dateForString(_ dateString: String) -> Date? {
        let dateFormatter: DateFormatter = getMM_dd_yyyyDateFormatter()
        return dateFormatter.date(from: dateString)
    }

    func stringForDate() -> String {
        let dateFormatter: DateFormatter = Date.getMM_dd_yyyyDateFormatter()
        return dateFormatter.string(from: self)
    }

    func redactedStringForDate() -> String {
        let dateFormatter: DateFormatter = Date.getMMM_dd_yyyyDateFormatter()
        return dateFormatter.string(from: self)
    }

    func isoStringForDate() -> String {
        let dateFormatter: DateFormatter = Date.getISODateFormatter()
        return dateFormatter.string(from: self)
    }

    func getMonthName() -> String {
        let calendar: Calendar = Date.getUTCCalendar()
        let dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.month, NSCalendar.Unit.year], from: self)
        let currentMonth: Int = dateComponents.month!
        let dateFormatter: DateFormatter = DateFormatter()
        return dateFormatter.monthSymbols[currentMonth-1]
    }

    // MARK: - Timestamp

    static func timestampStringFromDate(_ date: Date) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        return dateFormatter.string(from: date)
    }

    // MARK: - Validators

    func isCurrentMonth() -> Bool {
        let calendar: Calendar = Date.getUTCCalendar()
        let dateComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.month], from: self)
        let nowComponents: DateComponents = (calendar as NSCalendar).components([NSCalendar.Unit.month], from: Date())
        return dateComponents.month == nowComponents.month
    }

    static func isOn2017() -> Bool {
        let dateFormatter: DateFormatter = Date.getMM_dd_yyyyDateFormatter()
        let today: Date = Date()
        let january2017: Date = dateFormatter.date(from: "1/1/2017")!
        return today.compare(january2017) != .orderedAscending
    }

    // MARK: - Date/POC
    fileprivate func convert(stringDate: String) {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")

        formatter.dateFormat = "dd-MM-yyyy" // our date format
        formatter.timeZone = TimeZone(abbreviation: "GMT+0:00") // current time zone
        let date = formatter.date(from: stringDate) // according to date format your date string
        print(date ?? "") // converted String to Date

        formatter.dateFormat = "MMM dd"
        let formattedDateString: String = formatter.string(from: date!)
        print(formattedDateString)
    }
}
