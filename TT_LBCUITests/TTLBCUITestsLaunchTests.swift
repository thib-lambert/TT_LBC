//
//  TTLBCUITestsLaunchTests.swift
//  TT_LBCUITests
//
//  Created by Thibaud Lambert on 13/07/2022.
//

import XCTest

class TTLBCUITestsLaunchTests: XCTestCase {
	
	// swiftlint:disable:next empty_xctest_method
	override class var runsForEachTargetApplicationUIConfiguration: Bool { true }

    override func setUpWithError() throws {
        continueAfterFailure = false
		
		try super.setUpWithError()
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
		
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
