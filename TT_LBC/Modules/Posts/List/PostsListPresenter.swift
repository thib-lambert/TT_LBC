//  PostsListPresenter.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

class PostsListPresenter: Presenter<PostsListViewModel> {
	
	func display(posts: [Post], categories: [Category]) {
		self.viewModel?.items = posts
			.sorted {
				guard
					let firstDate = $0.creationDate,
					let secondDate = $1.creationDate
				else { return false }
				
				return firstDate > secondDate
			}
			.compactMap { post in
				PostsListViewModel.Item(id: post.id,
										title: post.title,
										image: post.imageUrl,
										category: categories.first { $0.id == post.categoryId }?.name ?? "-",
										price: post.price.toPrice(currency: "€"),
										isImportant: post.isUrgent)
			}
		
		self.viewModel?.send()
	}
}
