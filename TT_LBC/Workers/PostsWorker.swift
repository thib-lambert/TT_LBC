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
}
