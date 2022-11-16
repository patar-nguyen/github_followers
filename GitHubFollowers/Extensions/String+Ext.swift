//
//  String+Ext.swift
//  GitHubFollowers
//
//  Created by Patrick Nguyen on 2022-11-09.
//

import Foundation

extension String {
    //do not need these functions as we change in the user model date to Date and use iso8601 in network manager
    
//    func convertToDate() -> Date? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//        dateFormatter.timeZone = .current
//
//        return dateFormatter.date(from: self)
//    }
//
//    func convertToDisplayFormat() -> String {
//        guard let date = self.convertToDate() else { return "N/A"}
//
//        return date.convertToMonthYearFormat()
//
//    }
}
