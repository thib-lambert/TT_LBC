//
//  NetworkError.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

enum NetworkError: LocalizedError {
	
	case invalidUrl
	case invalidData
	
	var errorDescription: String? {
		switch self {
		case .invalidUrl: return "Invalid URL"
		case .invalidData: return "Invalid data"
		}
	}
}
