//
//  Date.swift
//  IndoreCovid19
//
//  Created by Harish Patidar on 02/12/19.
//  Copyright © 2019 Brain Above Technology. All rights reserved.
//

import Foundation

extension Date {
    enum DateFormate: String {
        case ddMMyyyy = "dd-MM-yyyy"
        case yyyyMMdd = "yyyy-MM-dd"
        case fullDate = "yyyy-MM-dd'T'HH:mm:ssZ"
        case month  = "MMM"
        case year = "yyyy"
        case date = "dd"
        case weekDay = "EEE"
        case fullWeekDay = "EEEE"
        case monthYear = "MMM yyyy"
        case dayWithDate = "EEEE, dd MMM yyyy"
        case dateMonth = "dd MMM"
        case dateWithTime = "dd-MM-yyyy hh:mm a"
        case dateWithTime24 = "dd-MM-yyyy HH:mm"
        case fullDateTime = "yyyy-MM-dd HH:mm:ss"
        case pickerDate = "MMM dd, yyyy"
        case pickerDateTime = "MMM dd, yyyy hh:mm a"
        case hours24 =  "HH:mm"
        case hours12 =  "hh:mm a"
        case time =  "HH:mm:ss"
        case dayShortWithDate = "MM/dd/yyyy"
        case dayShortWithIST = "dd/MM/yyyy"

    }
    
    // MARK: - Date Format Methods
    
    static func getFormattedDate(string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.yyyyMMdd.rawValue // This formate is input formated .
        let formateDate = dateFormatter.date(from:string)!
        dateFormatter.dateFormat = DateFormate.ddMMyyyy.rawValue // Output Formated
        return dateFormatter.string(from: formateDate)
    }
    
    static func UTCToLocal(_ UTCDateString: String, inputFormat: DateFormate = .yyyyMMdd, outputFormat: DateFormate = .yyyyMMdd) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat.rawValue //Input Format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let UTCDate = dateFormatter.date(from: UTCDateString)
        dateFormatter.dateFormat = outputFormat.rawValue // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    
    static func formatDateWithString(_ inputDateStr: String, inputFormat: DateFormate, outputFormat: DateFormate) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat.rawValue // Assin raw value of DateFormate to dateformatter object
        guard let inputDate = dateFormatter.date(from: inputDateStr) else { return "" }
        dateFormatter.dateFormat = outputFormat.rawValue
        return dateFormatter.string(from: inputDate)
    }
    
    // Function to select Start date and End date from calendar
    func generateDatesArrayBetweenTwoDates(startDate: Date , endDate:Date) ->[Date] {
        var datesArray: [Date] =  [Date]()
        var startDate = startDate
        let calendar = Calendar.current
        let format = DateFormatter()
        format.dateFormat = DateFormate.yyyyMMdd.rawValue
        while startDate <= endDate {
            datesArray.append(startDate)
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
        return datesArray
    }
    
    // Function to get String value from date component
    func getStringFromDate(sourceFormat: DateFormate, destinationFormat: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = destinationFormat.rawValue
        let desiredString = dateFormatter.string(from: self as Date) //Covert into required string format
        return desiredString
    }
    
    // Get Date into different format
    func getFormattedCurrentDate(_ format: DateFormate) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
    
    func getDateFromString(_ dateStr: String, format: DateFormate = .yyyyMMdd) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue // get date into year-month - day format
        let date = dateFormatter.date(from: dateStr)
        return date!
    }
    
    // Get time zone
    func toLocalTimeZone() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // Get all weekdays name in a string format
    func getWeekDayName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormate.fullWeekDay.rawValue
        let dayInWeek = formatter.string(from: self)
        return dayInWeek
    }
    
    // Cut current date into string format
    func trimCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormate.yyyyMMdd.rawValue
        let desireDateStr = dateFormatter.string(from: self)
        return desireDateStr
    }
    
    /*  This function is used convert date into 12 hours format, if the device default date is in 24 hours format then it will convert into 12 hours format. for eg.- AM/PM  */
    static func timeIsGreaterThan(_ fromDate: String , sourceFormat: DateFormate) -> Bool {
        let timmedFromDate = fromDate.trimmingCharacters(in: .whitespaces)
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "AM" // A convenient way to generate an appropriate localized date format, and set it, in a single operation.
        dateFormatter.pmSymbol = "PM"
        dateFormatter.formatterBehavior = .default
        dateFormatter.locale = Locale.init(identifier: Locale.current.identifier)
        dateFormatter.dateFormat = sourceFormat.rawValue
        guard let convertedDate = dateFormatter.date(from: timmedFromDate) else {
            return false
        }
        let currentDate = Date().toLocalTimeZone() // Convert current date to local time zone
        let classDate =  convertedDate.toLocalTimeZone() // converted date
        return (classDate.compare(currentDate) != .orderedAscending)
    }
    
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    static func years(from fromDate: Date, to toDate: Date, outputFormat format: DateFormate) -> [String] {
        var dates: [String] = []
        var date: Date = fromDate
        
        while date <= toDate {
            dates.append(date.getFormattedCurrentDate(format))
            guard let newDate = Calendar.current.date(byAdding: .year, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    
    func isBetween(_ date1: Date, and date2: Date) -> Bool {
        return (min(date1, date2) ... max(date1, date2)).contains(self)
    }

}
