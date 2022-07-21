//
//  Double+Price.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Double {
	
	func toPrice(currency: String, locale: Locale) -> String {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .decimal
		numberFormatter.locale = locale
		
		let price = numberFormatter.string(from: NSNumber(value: self))
		return "\(price ?? "") \(currency)"
	}
}
