//  PostsListViewModel.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import UIKit

class PostsListViewModel: ViewModel {
	
	struct Item {
		
		let id: Int
		let title: String
		let image: URL?
		let category: String
		let price: String
		let isImportant: Bool
	}
	
	var items: [Item] = []
}
