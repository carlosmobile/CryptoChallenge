//
//  CryptoAppFlowUITests.swift
//  CryptoChallengeTests
//
//  Created by Carlos Butron on 21/2/24.
//

import XCTest

class CryptoAppFlowUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["-UITesting"]
        app.launch()
    }

    func testCompleteFlowFromListToDetailAndBack() throws {
        let app = XCUIApplication()
        
        XCTAssertTrue(app.navigationBars["Cryptocurrencies"].exists, "The list navigation bar should exist.")
        
        let scrollView = app.scrollViews["MyCryptoList"]
        if scrollView.waitForExistence(timeout: 10) {
            scrollView.swipeUp()
            scrollView.swipeUp()
            scrollView.swipeDown()
            scrollView.swipeDown()
        }
        
        let cell = scrollView.staticTexts["Bitcoin"].firstMatch
        if cell.waitForExistence(timeout: 10) {
            cell.tap()
        }
        
        XCTAssertTrue(app.navigationBars["Crypto Details"].exists, "The detail navigation bar should exist.")
        
        let textField = app.textFields.element
        XCTAssertTrue(textField.waitForExistence(timeout: 5), "The text field should exist.")
        textField.tap()
        textField.typeText("100\n")
        
        let calculateButton = app.buttons["Calculate"]
        calculateButton.tap()
        
        let resultText = app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'You will have'")).firstMatch
        XCTAssertTrue(resultText.waitForExistence(timeout: 5), "The result text should exist.")
        
        app.navigationBars.buttons.element(boundBy: 0).tap() 
        
        XCTAssertTrue(app.navigationBars["Cryptocurrencies"].exists, "Should be back to the list.")
    }
}
