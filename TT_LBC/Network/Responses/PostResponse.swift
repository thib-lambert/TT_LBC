//
//  PostResponse.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

struct PostResponse: Decodable, Post {
	
	struct Images: Decodable {
		
		let small: String?
		let thumb: String?
	}
	
	enum CodingKeys: String, CodingKey {
		
		case id
		case categoryId = "category_id"
		case title, description, price
		case images = "images_url"
		case creationDate = "creation_date"
		case isUrgent = "is_urgent"
	}
	
	private let images: Images?
	
	var id: Int
	var categoryId: Int
	var title: String
	var description: String
	var price: Double
	var creationDate: String?
	var isUrgent: Bool
	
	var imageUrl: URL? {
		URL(self.images?.thumb ?? self.images?.small)
	}
}
