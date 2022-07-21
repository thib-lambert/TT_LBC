//  PostsListPresenter.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

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
			.map { post in
				PostsListViewModel.Item(id: post.id,
										title: post.title,
										image: post.imageUrl,
										category: categories.first { $0.id == post.categoryId }?.name ?? "-",
										price: post.price.toPrice(currency: "€", locale: Locale(identifier: "fr")),
										isImportant: post.isUrgent)
			}
		
		self.viewModel?.emptyText = (self.viewModel?.items.isEmpty ?? true)
		? "Aucune annonce.\nGlisser vers le bas pour réessayer !"
		: nil
		
		self.viewModel?.send()
	}
}
