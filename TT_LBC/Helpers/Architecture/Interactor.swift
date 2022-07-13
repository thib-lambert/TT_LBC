//  Interactor.swift
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import Foundation

@MainActor class Interactor<V: ViewModel, P: Presenter<V>> {
	
	// MARK: - Variables
	let presenter: P
	
	// MARK: - Init
	required init() {
		self.presenter = P()
	}
	
	func set(viewModel: V) {
		self.presenter.set(viewModel: viewModel)
	}
}
