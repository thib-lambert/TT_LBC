//
//  Post.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

protocol Post {
	
	var id: Int { get }
	var categoryId: Int { get }
	var title: String { get }
	var postDescription: String { get }
	var price: Double { get }
	var imageUrl: URL? { get }
	var creationDate: String? { get }
	var isUrgent: Bool { get }
}
