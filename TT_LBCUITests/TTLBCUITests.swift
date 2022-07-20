//
//  TTLBCUITests.swift
//  TT_LBCUITests
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import XCTest

class TTLBCUITests: XCTestCase {
	
	// MARK: - Variables
	private var app: XCUIApplication!
	
	override func setUpWithError() throws {
		continueAfterFailure = false
		
		try super.setUpWithError()
		
		self.app = XCUIApplication()
		self.app.launch()
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		
		self.app.terminate()
		self.app = nil
	}
	
	func testVisitApp() {
		let tableView = self.app.tables["PostsListViewController.tableView"]
		
		self.wait(element: tableView,
				  predicate: XCTestCase.kIsVisiblePredicate,
				  successCompletion: {
			let firstCell = tableView.cells.element(boundBy: 0)
			
			self.wait(element: firstCell,
					  predicate: XCTestCase.kIsVisiblePredicate,
					  successCompletion: {
				firstCell.tap()
				self.wait(element: self.app.otherElements["PostDetailsViewController"],
						  predicate: XCTestCase.kIsVisiblePredicate)
			}, failCompletion: {
				XCTFail("PostsListViewController.tableView not contains cells")
			})
		}, failCompletion: {
			XCTFail("PostsListViewController.tableView is not visible")
		})
	}
}
