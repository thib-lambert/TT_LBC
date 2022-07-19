//
//  PostCell.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation
import UIKit

class PostCell: UITableViewCell {
	
	// MARK: - Reuse identifier
	static let reuseIdentifier = "PostCell"
	
	// MARK: - UI
	private lazy var wrapper: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		view.layer.borderWidth = 2
		view.layer.masksToBounds = true
		view.layer.cornerRadius = 4
		view.layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMaxXMaxYCorner
		]
		
		return view
	}()
	
	private lazy var asyncImageView: AsyncImageView = {
		let imageView = AsyncImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		
		return imageView
	}()
	
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.spacing = 4
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		return stackView
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.font = .boldSystemFont(ofSize: 16)
		label.minimumScaleFactor = 0.75
		label.adjustsFontSizeToFitWidth = true
		label.textColor = .black
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private lazy var categoryLabel: UILabel = {
		let label = UILabel()
		label.font = .italicSystemFont(ofSize: 12)
		label.textColor = .lightSlateGrey
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private lazy var priceLabel: UILabel = {
		let label = UILabel()
		label.font = .boldSystemFont(ofSize: 14)
		label.textColor = .black
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private lazy var importantLabel: PaddingLabel = {
		let label = PaddingLabel()
		label.font = .boldSystemFont(ofSize: 14)
		label.minimumScaleFactor = 0.75
		label.adjustsFontSizeToFitWidth = true
		label.textColor = .white
		label.translatesAutoresizingMaskIntoConstraints = false
		label.backgroundColor = .blazeOrange
		label.text = "IMPORTANT"
		label.updateAllCorners(with: 4)
		label.textAlignment = .center
		label.layer.cornerRadius = 4
		label.layer.masksToBounds = true
		label.layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMaxXMaxYCorner
		]
		
		return label
	}()
	
	// MARK: - Variables
	var item: PostsListViewModel.Item! {
		didSet {
			self.asyncImageView.url = self.item.image
			self.titleLabel.text = self.item.title
			self.categoryLabel.text = self.item.category
			self.priceLabel.text = self.item.price
			self.importantLabel.isHidden = !self.item.isImportant
			self.wrapper.layer.borderColor = self.item.isImportant ? UIColor.blazeOrange.cgColor : UIColor.lightSlateGrey.cgColor
		}
	}
	
	// MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		self.setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		self.setup()
	}
	
	private func setup() {
		self.backgroundColor = .clear
		self.contentView.backgroundColor = .clear
		
		self.stackView.addArrangedSubview(self.titleLabel)
		self.stackView.addArrangedSubview(self.priceLabel)
		self.stackView.addArrangedSubview(self.categoryLabel)
		
		self.wrapper.addSubview(self.asyncImageView)
		self.wrapper.addSubview(self.stackView)
		self.wrapper.addSubview(self.importantLabel)
		
		self.contentView.addSubview(self.wrapper)
		
		NSLayoutConstraint.activate([
			// Wrapper
			self.wrapper.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
			self.wrapper.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4),
			self.wrapper.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
			self.wrapper.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4),
			
			// ImageView
			self.asyncImageView.widthAnchor.constraint(equalTo: self.wrapper.widthAnchor, multiplier: 0.25),
			self.asyncImageView.heightAnchor.constraint(equalTo: self.wrapper.widthAnchor, multiplier: 0.25),
			self.asyncImageView.leadingAnchor.constraint(equalTo: self.wrapper.leadingAnchor),
			self.asyncImageView.topAnchor.constraint(equalTo: self.wrapper.topAnchor),
			self.wrapper.bottomAnchor.constraint(equalTo: self.asyncImageView.bottomAnchor),
			
			// StackView
			self.stackView.topAnchor.constraint(equalTo: self.wrapper.topAnchor, constant: 4),
			self.wrapper.bottomAnchor.constraint(greaterThanOrEqualTo: self.stackView.bottomAnchor, constant: 4),
			self.stackView.trailingAnchor.constraint(equalTo: self.wrapper.trailingAnchor, constant: -4),
			self.stackView.leadingAnchor.constraint(equalTo: self.asyncImageView.trailingAnchor, constant: 4),
			
			// Important
			self.importantLabel.topAnchor.constraint(equalTo: self.wrapper.topAnchor, constant: 4),
			self.wrapper.bottomAnchor.constraint(greaterThanOrEqualTo: self.importantLabel.bottomAnchor, constant: 4),
			self.importantLabel.leadingAnchor.constraint(equalTo: self.wrapper.leadingAnchor, constant: 4),
			self.wrapper.trailingAnchor.constraint(greaterThanOrEqualTo: self.importantLabel.trailingAnchor, constant: 4)
		])
	}
	
	// MARK: - View life cycle
	override func prepareForReuse() {
		super.prepareForReuse()
		
		self.asyncImageView.resetState()
	}
}
