//
//  Date+String.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Date {
	
	func toString(format: String = "yyyy-MM-dd'T'HH:mm:ssZ",
						 locale: Locale = Locale.current) -> String {
		let formatter = DateFormatter()
		formatter.locale = locale
		formatter.dateFormat = format
		
		return formatter.string(from: self)
	}
}

extension String {
	
	func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ssZ",
					   locale: Locale = Locale.current) -> Date? {
		let formatter = DateFormatter()
		formatter.locale = locale
		formatter.dateFormat = format
		return formatter.date(from: self)
	}
}
