//
//  Date+Extensions.swift
//  SampleSeatGeek
//
//  Created by Mallesh Thanneeru on 4/17/21.
//

import Foundation


extension String {
    
    func convertToDate() ->  String {
       
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from:self)!
        dateFormatter.dateFormat = "E, d MMM yyyy hh : mm a"
        let formatedDate = dateFormatter.string(from: date)
        return formatedDate
    }
}
