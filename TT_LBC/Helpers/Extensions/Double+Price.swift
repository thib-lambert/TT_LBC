//
//  Double+Price.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Double {
	
	func toPrice(currency: String? = nil) -> String {
		let numberFormatter = NumberFormatter()
		
		if let currency: String = currency {
			numberFormatter.numberStyle = NumberFormatter.Style.decimal
			if let price: String = numberFormatter.string(from: NSNumber(value: self)) {
				return "\(price) \(currency)"
			}
		} else {
			numberFormatter.numberStyle = NumberFormatter.Style.currency
			if let price: String = numberFormatter.string(from: NSNumber(value: self)) {
				return price
			}
		}
		
		return ""
	}
}
