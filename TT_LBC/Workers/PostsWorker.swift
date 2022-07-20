//
//  PostsWorker.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

struct PostsWorker {
	
	func fetch() async throws -> [Post] {
		let posts = try await APIManager.shared.fetch(type: [PostResponse].self,
								from: URL("https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json"))
		
		UserDefaultsManager.shared.posts = posts
		
		return posts
	}
	
	func fetchLocally() -> [Post] {
		UserDefaultsManager.shared.posts
	}
	
	func fetch(for postId: Int) -> Post? {
		UserDefaultsManager.shared.posts.first { $0.id == postId }
	}
}
