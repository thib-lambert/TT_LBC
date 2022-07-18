//
//  APIManager.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

class APIManager {

	// MARK: - Singleton
	static let shared = APIManager()
	
	// MARK: - Init
	private init() { }
	
	// MARK: - Fetch
	func fetch<T: Decodable>(type: T.Type, from url: URL?) async throws -> T {
		guard let _url = url else {
			let error = NetworkError.invalidUrl
			
			Log.error(error)
			throw error
		}
		
		Log.network(.sending, url: _url.absoluteString)
		return try await withCheckedThrowingContinuation { continuation in
			let task = URLSession.shared.dataTask(with: _url) { data, response, error in
				if let error = error {
					continuation.resume(throwing: error)
					return
				}
				
				guard let data = data else {
					let error = NetworkError.invalidData
					
					Log.network(.error, url: _url.absoluteString, error: error)
					continuation.resume(throwing: error)
					return
				}
				
				do {
					let jsonResponse = try T.decode(from: data)
					
					Log.network(.success, url: _url.absoluteString)
					continuation.resume(returning: jsonResponse)
				} catch {
					Log.network(.error, url: _url.absoluteString, error: error)
					continuation.resume(throwing: error)
				}
			}
			
			task.resume()
		}
	}
}
