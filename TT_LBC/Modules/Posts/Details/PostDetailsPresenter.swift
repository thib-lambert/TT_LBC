//  PostDetailsPresenter.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

class PostDetailsPresenter: Presenter<PostDetailsViewModel> {
	
	func display(post: Post, category: Category?) {
		self.viewModel?.category = category?.name ?? "-"
		self.viewModel?.title = post.title
		self.viewModel?.description = post.postDescription
		self.viewModel?.price = post.price.toPrice(currency: "€")
		self.viewModel?.image = post.imageUrl
		self.viewModel?.creationDate = post.creationDate
		self.viewModel?.isUrgent = post.isUrgent
		
		self.viewModel?.send()
	}
}
