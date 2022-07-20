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
	}
}
