//  PostDetailsViewController.swift
//
//  Created by Thibaud Lambert on 19/07/2022.
//

import UIKit

class PostDetailsViewController: BaseViewController
<
	PostDetailsViewModel,
	PostDetailsPresenter,
	PostDetailsInteractor
> {
	
	// MARK: - UI
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.isHidden = true
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		
		return scrollView
	}()
	
	private let stackViewContainer: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 12
		stackView.alignment = .fill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		return stackView
	}()
	
	private let stackViewInfos: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.spacing = 0
		stackView.alignment = .fill
		
		return stackView
	}()
	
	private lazy var asyncImageView: AsyncImageView = {
		let imageView = AsyncImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.layer.cornerRadius = 8
		imageView.layer.masksToBounds = true
		imageView.layer.maskedCorners = [
			.layerMinXMinYCorner,
			.layerMaxXMinYCorner,
			.layerMinXMaxYCorner,
			.layerMaxXMaxYCorner
		]
		
		return imageView
	}()
	
	private lazy var urgentLabel: UrgentLabel = {
		let label = UrgentLabel()
		label.isHidden = true
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	private let separator: UIView = {
		let view = UIView()
		view.backgroundColor = .lightSlateGrey
		
		return view
	}()
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .boldSystemFont(ofSize: 16)
		label.textColor = .black
		
		return label
	}()
	
	private lazy var priceLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .boldSystemFont(ofSize: 14)
		label.textColor = .black
		
		return label
	}()
	
	private lazy var categoryLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .italicSystemFont(ofSize: 14)
		label.textColor = .lightSlateGrey
		
		return label
	}()
	
	private lazy var dateLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .italicSystemFont(ofSize: 14)
		label.textColor = .lightSlateGrey
		
		return label
	}()
	
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 14)
		label.textColor = .black
		
		return label
	}()
	
	// MARK: - Variables
	var postId: Int!
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.interactor.refresh(for: self.postId)
	}
	
	override func setup() {
		super.setup()
		
		self.stackViewInfos.addArrangedSubview(self.titleLabel)
		self.stackViewInfos.addArrangedSubview(self.priceLabel)
		self.stackViewInfos.addArrangedSubview(self.categoryLabel)
		self.stackViewInfos.addArrangedSubview(self.dateLabel)
		
		self.stackViewContainer.addArrangedSubview(self.stackViewInfos)
		self.stackViewContainer.addArrangedSubview(self.separator)
		self.stackViewContainer.addArrangedSubview(self.descriptionLabel)
		
		self.scrollView.addSubview(self.asyncImageView)
		self.scrollView.addSubview(self.self.stackViewContainer)
		
		self.view.addSubview(self.scrollView)
		self.view.addSubview(self.urgentLabel)
		
		NSLayoutConstraint.activate([
			// ScrollView
			self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			
			// ImageView
			self.asyncImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 4),
			self.asyncImageView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 8),
			self.asyncImageView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 8),
			self.asyncImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			self.asyncImageView.heightAnchor.constraint(equalTo: self.asyncImageView.widthAnchor, multiplier: 0.75),
			
			// StackViewContainer
			self.stackViewContainer.topAnchor.constraint(equalTo: self.asyncImageView.bottomAnchor, constant: 8),
			self.stackViewContainer.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 4),
			self.stackViewContainer.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 12),
			self.stackViewContainer.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: 12),
			
			// Separator
			self.separator.heightAnchor.constraint(equalToConstant: 1),
			
			// ImportantLabel
			self.asyncImageView.trailingAnchor.constraint(equalTo: self.urgentLabel.trailingAnchor, constant: 4),
			self.urgentLabel.topAnchor.constraint(equalTo: self.asyncImageView.topAnchor, constant: 4),
			self.asyncImageView.bottomAnchor.constraint(greaterThanOrEqualTo: self.urgentLabel.bottomAnchor, constant: 4),
			self.urgentLabel.leadingAnchor.constraint(greaterThanOrEqualTo: self.asyncImageView.leadingAnchor, constant: 4)
		])
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
		
		self.scrollView.isHidden = self.title == nil
		self.urgentLabel.isHidden = self.title == nil
		
		self.title = self.viewModel.title
		self.asyncImageView.url = self.viewModel.image
		self.titleLabel.text = self.viewModel.title
		self.priceLabel.text = self.viewModel.price
		self.categoryLabel.text = self.viewModel.category
		self.dateLabel.text = self.viewModel.creationDate
		self.descriptionLabel.text = self.viewModel.description
		self.urgentLabel.isHidden = !self.viewModel.isUrgent
	}
}
