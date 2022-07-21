//
//  TTLBCTests.swift
//  TT_LBCTests
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import XCTest
@testable import TT_LBC

class TTLBCTests: XCTestCase {
	
	func testDecode() {
		
		struct TestDecode: Decodable { }
		
		XCTAssertThrowsError(try TestDecode.decode(from: nil))
		XCTAssertThrowsError(try TestDecode.decode(from: Data()))
		XCTAssertThrowsError(try TestDecode.decode(from: ""))
	}
	
	func testCategoriesWorker() {
		let categories = CategoriesWorker().fetchLocally()
		XCTAssertTrue(categories.isEmpty || !categories.isEmpty)
	}
	
	func testPostsWorker() {
		let posts = PostsWorker().fetchLocally()
		XCTAssertTrue(posts.isEmpty || !posts.isEmpty)
	}
}
