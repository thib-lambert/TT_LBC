//
//  TTLBCUITests.swift
//  TT_LBCUITests
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import XCTest

class TTLBCUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
		
		try super.setUpWithError()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
