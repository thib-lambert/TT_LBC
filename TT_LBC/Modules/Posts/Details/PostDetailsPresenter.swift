//  PostDetailsPresenter.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

class PostDetailsPresenter: Presenter<PostDetailsViewModel> {
	
	func display(post: Post, in category: String) {
		self.viewModel?.category = category
		self.viewModel?.title = post.title
		self.viewModel?.description = post.description
		self.viewModel?.price = post.price.toPrice(currency: "€")
		self.viewModel?.image = post.imageUrl
		self.viewModel?.creationDate = post.creationDate
		self.viewModel?.isUrgent = post.isUrgent
		
		self.viewModel?.send()
	}
}
