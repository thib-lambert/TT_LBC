//  PostsListPresenter.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

class PostsListPresenter: Presenter<PostsListViewModel> {
	
	func display(posts: [Post], categories: [Category]) {
		self.viewModel?.items = posts.compactMap { post in
			PostsListViewModel.Item(id: post.id,
									title: post.title,
									image: post.imageUrl,
									category: categories.first { category in post.categoryId == category.id }?.name ?? "-",
									price: post.price.toPrice(currency: "€"),
									isImportant: post.isUrgent)
		}
		
		self.viewModel?.send()
	}
}
