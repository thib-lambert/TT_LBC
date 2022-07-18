//
//  Date+String.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Date {
	
	func toString(format: String = "dd/MM/yyyy",
						 locale: Locale = Locale.current) -> String {
		let formatter = DateFormatter()
		formatter.locale = locale
		formatter.dateFormat = format
		
		return formatter.string(from: self)
	}
}
