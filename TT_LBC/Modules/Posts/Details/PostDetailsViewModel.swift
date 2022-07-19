//  PostDetailsViewModel.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

import Foundation

class PostDetailsViewModel: ViewModel {
	
	var category: String?
	var title: String?
	var description: String?
	var price: String?
	var image: URL?
	var creationDate: String?
	var isUrgent = false
}
