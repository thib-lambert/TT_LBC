//  PostsListInteractor.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

class PostsListInteractor: Interactor
<
	PostsListViewModel,
	PostsListPresenter
> {
	
	// MARK: - Worker
	private let categoriesWorker = CategoriesWorker()
	private let postsWorker = PostsWorker()
	
	// MARK: - Refresh
	func refresh(withLoader: Bool) {
		if withLoader {
			self.presenter.display(loader: true)
		}
		
		Task {
			do {
				async let categories = self.categoriesWorker.fetch()
				async let posts = self.postsWorker.fetch()
				
				try await self.presenter.display(posts: posts, categories: categories)
				
				if withLoader {
					self.presenter.display(loader: false)
				}
			} catch {
				Log.error(error)
				
				self.presenter.display(posts: self.postsWorker.fetchLocally(),
									   categories: self.categoriesWorker.fetchLocally())
				
				if withLoader {
					self.presenter.display(loader: false)
				}
			}
		}
	}
}
