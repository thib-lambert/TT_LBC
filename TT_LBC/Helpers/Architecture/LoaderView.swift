//  LoaderView.swift
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import UIKit

class LoaderView: UIView {
	
	// MARK: - UI
	private lazy var activityIndicator: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView(style: .large)
		view.color = .blazeOrange
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		self.setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		self.setup()
	}
	
	func setup() {
		self.addSubview(self.activityIndicator)
		
		NSLayoutConstraint.activate([
			self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
		])
	}
	
	// MARK: - Functions
	func play() {
		self.activityIndicator.startAnimating()
		self.isHidden = false
	}
	
	func stop() {
		self.activityIndicator.stopAnimating()
		self.isHidden = true
	}
}
