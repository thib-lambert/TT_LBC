//
//  CategoriesWorker.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import Foundation

struct CategoriesWorker {
	
	func fetch() async throws -> [Category] {
		try await APIManager.shared.fetch(type: [CategoryResponse].self,
								from: URL( "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"))
	}
}
