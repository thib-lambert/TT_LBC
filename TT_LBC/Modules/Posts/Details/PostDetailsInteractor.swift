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
	
	// TODO: - Add workers
	
	// MARK: - Refresh
	func refresh(for postId: Int) {
		self.presenter.display(loader: true)
		
		Task {
			// TODO: - Fetch real data
			let post = FakePost()
			let category = "Véhicule"
			self.presenter.display(post: post, in: category)
			self.presenter.display(loader: false)
		}
	}
}

// TODO: - Delete
private struct FakePost: Post {
	
	var id: Int { 2_148_570_710 }
	var categoryId: Int { 1 }
	var title: String { "Audi RS6 AVANT 4.0 V8 TFSI 600CH QUATTRO TIPTRONIC 53CV" }
	// swiftlint:disable:next line_length
	var description: String { "Audi RS6 AVANT 4.0 V8 TFSI 600CH QUATTRO TIPTRONIC 53CV, GRIS NARDO, 53cv, 5 portes, mise en circulation le 23-02-2022, garantie 24 mois.\n5 places, couleur intérieur : NOIR, longueur : 5,00 mètres, boîte de vitesse : automatique\nOPTIONS ET EQUIPEMENTS :Référence annonce : 973" }
	var price: Double { 199_990 }
	var imageUrl: URL? { URL("https://img.leboncoin.fr/api/v1/lbcpb1/images/9d/70/ab/9d70ab16b53a9286fcc56ea2287ba9a934e73ec5.jpg?rule=classified-1200x800-webp") }
	var creationDate: String? { "12/07/2022" }
	var isUrgent: Bool { true }
}
