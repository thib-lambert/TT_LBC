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
			throw NetworkError.invalidUrl
		}
		
		return try await withCheckedThrowingContinuation { continuation in
			let task = URLSession.shared.dataTask(with: _url) { data, response, error in
				if let error = error {
					continuation.resume(throwing: error)
					return
				}
				
				guard let data = data else {
					continuation.resume(throwing: NetworkError.invalidData)
					return
				}
				
				do {
					let jsonResponse = try T.decode(from: data)
					continuation.resume(returning: jsonResponse)
				} catch {
					// TODO: - add logs
					continuation.resume(throwing: error)
				}
			}
			
			task.resume()
		}
	}
}
