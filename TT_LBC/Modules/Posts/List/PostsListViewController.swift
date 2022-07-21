//  PostsListViewController.swift
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import UIKit

class PostsListViewController: BaseViewController
<
	PostsListViewModel,
	PostsListPresenter,
	PostsListInteractor
> {
	
	// MARK: - UI
	private lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.dataSource = self
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.showsVerticalScrollIndicator = false
		tableView.separatorStyle = .none
		tableView.tableFooterView = UIView()
		tableView.backgroundColor = .clear
		tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseIdentifier)
		tableView.accessibilityIdentifier = "PostsListViewController.tableView"
		
		return tableView
	}()
	
	private lazy var refreshControl: UIRefreshControl = {
		let refresh = UIRefreshControl()
		refresh.tintColor = .blazeOrange
		refresh.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
		
		return refresh
	}()
	
	private lazy var emptyLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .boldSystemFont(ofSize: 16)
		label.textAlignment = .center
		label.textColor = .lightSlateGrey
		
		return label
	}()
	
	// MARK: - View life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Liste"
		
		self.interactor.refresh(withLoader: true)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	override func setup() {
		super.setup()
		
		self.tableView.backgroundView = self.emptyLabel
		self.tableView.refreshControl = self.refreshControl
		
		self.view.addSubview(self.tableView)
		self.tableView.addSubview(self.refreshControl)
		
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
		])
	}
	
	// MARK: - Refresh
	override func refreshUI() {
		super.refreshUI()
		
		self.refreshControl.endRefreshing()
		self.emptyLabel.text = self.viewModel.emptyText
		self.tableView.reloadData()
	}
	
	@objc
	private func refresh() {
		self.refreshControl.beginRefreshing()
		self.interactor.refresh(withLoader: false)
	}
}

// MARK: - UITableViewDataSource
extension PostsListViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.viewModel.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let item = self.viewModel.items[safe: indexPath.row],
			  let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier, for: indexPath) as? PostCell
		else {
			return UITableViewCell()
		}
		
		cell.selectionStyle = .none
		cell.item = item
		
		return cell
	}
}

// MARK: - UITableViewDelegate
extension PostsListViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let id = self.viewModel.items[safe: indexPath.row]?.id else { return }
		
		let details = PostDetailsViewController()
		details.postId = id
		
		self.show(details, sender: nil)
	}
}
