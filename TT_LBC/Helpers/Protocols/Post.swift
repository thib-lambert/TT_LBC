//
//  Post.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

protocol Post {
	
	var id: Int { get }
	var category: Int { get }
	var title: String { get }
	var description: String { get }
	var price: Double { get }
	var imageUrl: URL? { get }
	var creationDate: String? { get }
	var isUrgent: Bool { get }
}
