//
//  Log.swift
//  TT_LBC
//
//  Created by Thibaud Lambert on 18/07/2022.
//

import Foundation

private protocol LogType {
	
	var prefix: String { get }
}

class Log {
	
	// MARK: - Enum
	enum DefaultLogType: LogType {
		
		case debug
		
		var prefix: String {
			switch self {
			case .debug: return "🕹"
			}
		}
	}
	
	enum NetworkLogType: LogType {
		
		case sending
		case success
		case error
		case downloadStart
		case downloadStop
		
		var prefix: String {
			switch self {
			case .sending: return "➡️"
			case .success: return "✅"
			case .error: return "❌"
			case .downloadStart: return "📥▶️"
			case .downloadStop: return "📥⏹️"
			}
		}
	}
	
	// MARK: - Helpers
	 private static func show(_ type: LogType,
							 _ message: String?,
					 error: Error? = nil) {
		var messages: [String?] = []
		
		let date = Date().toString(format: "MM-dd-yyyy HH:mm:ss", locale: Locale(identifier: "en"))
		messages.append("\(date) ~ \(type.prefix) -")
		
		if let message = message {
			messages.append(message)
		}
		
		if let error: Error = error {
			messages.append("🛑 \(error.localizedDescription)")
		}
		
		print(messages.compactMap { $0 }.joined(separator: " "))
	}
	
	static func error(_ error: Error?) {
		Self.show(DefaultLogType.debug, nil, error: error)
	}
	
	static func debug(_ message: String?) {
		Self.show(DefaultLogType.debug, message, error: nil)
	}
	
	static func network(_ type: NetworkLogType, url: String?, error: Error? = nil) {
		Self.show(type, url, error: error)
	}
}
