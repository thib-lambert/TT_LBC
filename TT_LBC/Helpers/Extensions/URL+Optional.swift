//
//  URL+Optional.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension URL {
	
	init?(_ string: String?) {
		guard let string = string else {
			return nil
		}

		self.init(string: string)
	}
}
