//
//  UserDefaultsManager.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 21/07/2022.
//

import Foundation

@propertyWrapper
struct UserDefaultsValue<T: Codable> {
	let key: String
	let defaultValue: T
	
	var wrappedValue: T {
		get {
			guard let data = UserDefaultsManager.shared.defaults.data(forKey: key) else { return defaultValue }
			return (try? JSONDecoder().decode(T.self, from: data)) ?? defaultValue
		}
		set {
			UserDefaultsManager.shared.defaults.set(try? JSONEncoder().encode(newValue), forKey: key)
			UserDefaultsManager.shared.defaults.synchronize()
		}
	}
}

class UserDefaultsManager {
	
	// MARK: - Singleton
	static let shared = UserDefaultsManager()
	
	// MARK: - Variables
	fileprivate let defaults: UserDefaults
	
	@UserDefaultsValue(key: "posts", defaultValue: [])
	var posts: [PostResponse]
	
	@UserDefaultsValue(key: "categories", defaultValue: [])
	var categories: [CategoryResponse]
	
	// MARK: - Init
	private init() {
		self.defaults = UserDefaults(suiteName: "TT-LBC") ?? .standard
	}
}
