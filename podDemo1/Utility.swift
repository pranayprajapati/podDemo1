//
//  Utility.swift
//  Nice&Bella
//
//  Created by Charan on 23/08/18.
//  Copyright © 2018 CodeBrew. All rights reserved.
//

import UIKit

class Utility {
    
    //convert array into string
    class func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    class func convertDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertDateFormaterSubscriptionDetail(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssa"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertOnlyDateFormater(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertOnlyDateFormater2(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertOnlyDateFormater3(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertOnlyDateFormater4(_ date: String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "dd MMM yyyy"
        return  dateFormatter.string(from: date!)
        
    }
    
    class func convertTimeFormater(_ time: String) -> String{
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm:ss"
        
        let fullDate = dateFormatter.date(from: time)
        
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: fullDate!)
        
    }
    
    class func currentDate() -> String
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MMM d, yyyy"
        return formatter.string(from: Date())
    }
    
    class func currentTime() -> String
    {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        //let timeString = formatter.string(from: Date())
        //print(timeString)   // "4:44 PM on June 23, 2016\n"
        return formatter.string(from: Date())
    }
    
    class func fileName() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "ddMMyyyyhmmss"
        return formatter.string(from: Date())
    }
    
    class func convertTimestamptoLastMsgDateTimeString(timestamp: String) -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp)!)
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd-MM-yyyy" //Specify your format that you want
        let msgDate : String = dateFormatter.string(from: date)
        let todayDate : String = dateFormatter.string(from: Date())
        
        if msgDate == todayDate {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        } else {
            return checkMsgTimeDate(msgDate: msgDate)
        }
    }
    
    class func checkMsgTimeDate(msgDate : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let yesterdayDate : String = dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        
        if yesterdayDate == msgDate {
            return "Yesterday"
        } else {
            dateFormatter.dateFormat = "d/M/yy"
            return dateFormatter.string(from: dateFormatter.date(from: msgDate)!)
        }
    }
    
    class func convertTimestamptoTimeString(timestamp: String) -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp)!)
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "h:mm a" 
        
        return dateFormatter.string(from: date)
    }
    
    class func convertTimestamptoDateString(timestamp: Int) -> String {
        //let date = Date(timeIntervalSince1970: Double(timestamp)!)
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "MMM d, yyyy" //Specify your format that you want
        let msgDate : String = dateFormatter.string(from: date)
        
        return msgDate  //dateFormatter.string(from: date)
    }
}
