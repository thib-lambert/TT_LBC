//  PostDetailsPresenter.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

import Foundation

class PostDetailsPresenter: Presenter<PostDetailsViewModel> {
	
	func display(post: Post, category: Category?) {
		self.viewModel?.category = category?.name ?? "-"
		self.viewModel?.title = post.title
		self.viewModel?.description = post.postDescription
		self.viewModel?.price = post.price.toPrice(currency: "€", locale: Locale(identifier: "fr"))
		self.viewModel?.image = post.imageUrl
		self.viewModel?.isUrgent = post.isUrgent
		
		let postDate = post.creationDate?.toDate()
		let date = postDate?.toString(format: "dd/MM/yyyy") ?? ""
		let hours = postDate?.toString(format: "HH:mm") ?? ""
		self.viewModel?.creationDate = [date, "à", hours].joined(separator: " ")
		
		self.viewModel?.send()
	}
}
