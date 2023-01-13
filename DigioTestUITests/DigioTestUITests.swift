//
//  DigioTestUITests.swift
//  DigioTestUITests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest

class DigioTestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
