//
//  ClickerListUITests.swift
//  Clicker UIUITests
//
//  Created by CJ Willis on 5/23/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import XCTest

class ClickerListUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testElementsExist() {
        let listTab = app.tabBars.buttons["list.dash"] // Tab item did not have accessibility identifier, so used what was available.
        // Given I have launched the application
        
        // When
        // I tap on the List tab
        listTab.tap()
        
        // Then
        // I will be taken to the List view
        // And I will see the UI elements on the screen
        XCTAssertTrue(listTab.isSelected)
        let clickerLabel = app.staticTexts["clickerListLabel"]
        let addButton = app.buttons["newClickerButton"]
        
        XCTAssertTrue(clickerLabel.exists)
        XCTAssertTrue(addButton.exists)
    }

}
