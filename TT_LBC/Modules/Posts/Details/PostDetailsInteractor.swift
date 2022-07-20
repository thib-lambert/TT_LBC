//  PostDetailsInteractor.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

import Foundation

class PostDetailsInteractor: Interactor
<
	PostDetailsViewModel,
	PostDetailsPresenter
> {
	
	// MARK: - Workers
	private let postsWorker = PostsWorker()
	private let categoriesWorker = CategoriesWorker()
	
	// MARK: - Refresh
	func refresh(for postId: Int) {
		self.presenter.display(loader: true)
		
		Task {
			guard let post = self.postsWorker.fetch(for: postId) else { return }
			
			self.presenter.display(post: post,
								   category: self.categoriesWorker.fetch(for: post.categoryId))
			self.presenter.display(loader: false)
		}
	}
}
