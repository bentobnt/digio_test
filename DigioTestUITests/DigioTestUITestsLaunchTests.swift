//
//  DigioTestUITestsLaunchTests.swift
//  DigioTestUITests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest

class DigioTestUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
