//
//  CategoriesWorker.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import Foundation

struct CategoriesWorker {
	
	func fetch() async throws -> [Category] {
		let categories = try await APIManager.shared.fetch(type: [CategoryResponse].self,
								from: URL( "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json"))
		
		UserDefaultsManager.shared.categories = categories
		
		return categories
	}
	
	func fetchLocally() -> [Category] {
		UserDefaultsManager.shared.categories
	}
	
	func fetch(for categoryId: Int) -> Category? {
		UserDefaultsManager.shared.categories.first { $0.id == categoryId }
	}
}
