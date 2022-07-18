//
//  CategoryResponse.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import Foundation

struct CategoryResponse: Decodable, Category {
	
	var id: Int
	var name: String
}
