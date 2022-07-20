//
//  AsyncImageView.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation
import UIKit

class AsyncImageView: UIView {
	
	// MARK: - UI
	private lazy var activityIndicator: UIActivityIndicatorView = {
		let view = UIActivityIndicatorView(style: .medium)
		view.color = .blazeOrange
		view.translatesAutoresizingMaskIntoConstraints = false
		
		return view
	}()
	
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.isHidden = true
		
		return imageView
	}()
	
	// MARK: - Variables
	private var downloadTask: Task<Void, Error>?
	var url: URL? {
		didSet {
			self.set(from: self.url)
		}
	}
	
	override var contentMode: UIView.ContentMode {
		didSet {
			self.imageView.contentMode = self.contentMode
		}
	}
	
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
		self.addSubview(self.imageView)
		
		NSLayoutConstraint.activate([
			// Activity indicator
			self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			
			// ImageView
			self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
			self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			self.imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
			self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
		])
	}
	
	// MARK: - Helpers
	func resetState() {
		self.cancelDownload()
		self.imageView.image = nil
		self.imageView.isHidden = true
	}
	
	private func cancelDownload() {
		Log.network(.downloadStop, url: self.url?.absoluteString)
		self.downloadTask?.cancel()
		self.activityIndicator.stopAnimating()
	}
	
	private func set(from url: URL?) {
		self.activityIndicator.startAnimating()
		
		Task {
			do {
				guard let url = url else {
					Log.error(NetworkError.invalidUrl)
					return
				}
				
				try Task.checkCancellation()
				
				let image = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<UIImage?, Error>) -> Void in
					let task = URLSession.shared.dataTask(with: url) { data, _, error in
						if let error = error {
							continuation.resume(throwing: error)
							return
						}
						
						guard let data = data else {
							let error = NetworkError.invalidData
							
							Log.network(.error, url: url.absoluteString, error: error)
							continuation.resume(throwing: error)
							return
						}
						
						continuation.resume(returning: UIImage(data: data))
					}
					
					task.resume()
				}
				
				self.imageView.image = image
				self.imageView.isHidden = false
			} catch {
				Log.error(error)
				self.imageView.image = nil
				self.imageView.isHidden = true
			}
		}
	}
}
