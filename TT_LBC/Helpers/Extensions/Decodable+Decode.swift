//
//  Decodable+Decode.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Decodable {
	
	static func decode(from data: Any?) throws -> Self {
		
		if let data = data,
		   let jsonData = (data as? Data) {
			do {
				let object: Self = try JSONDecoder().decode(Self.self, from: jsonData)
				return object
			} catch {
				Log.error(error)
				throw error
			}
		} else {
			throw NetworkError.invalidData
		}
	}
}
