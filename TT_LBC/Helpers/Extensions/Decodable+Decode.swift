//
//  Decodable+Decode.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

extension Decodable {
	
	public static func decode(from data: Any?) throws -> Self {
		
		if let data = data,
		   let jsonData = (data as? Data) ?? (try? JSONSerialization.data(withJSONObject: data)) {
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
