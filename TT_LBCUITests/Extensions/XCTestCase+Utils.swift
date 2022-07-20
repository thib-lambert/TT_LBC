//
//  XCTestCase+Utils.swift
//  TT_LBCTests
//
//  Created by Thibaud Lambert on 20/07/2022.
//

import Foundation
import XCTest

extension XCTestCase {
	
	private static let kTimeout: Double = 30
	static let kIsVisiblePredicate = NSPredicate(format: "exists == true && isHittable == true")
	
	func wait(element: XCUIElement,
			  predicate: NSPredicate,
			  successCompletion: (() -> Void)? = nil,
			  failCompletion: (() -> Void)? = nil,
			  timeout: Double = XCTestCase.kTimeout) {
		let exp: XCTestExpectation = self.expectation(for: predicate,
													  evaluatedWith: element,
													  handler: nil)
		if XCTWaiter.wait(for: [exp], timeout: timeout) == .completed {
			successCompletion?()
		} else {
			failCompletion?()
		}
	}
}
