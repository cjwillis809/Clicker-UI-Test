//
//  Clicker_UIUITests.swift
//  Clicker UIUITests
//
//  Created by CJ Willis on 5/22/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import XCTest

class Clicker_UIUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Tests that all elements appear as they should on launch
    func testElementsExist() {
        let plusButton = app/*@START_MENU_TOKEN@*/.buttons["clickerAddButton"]/*[[".buttons[\"+\"]",".buttons[\"clickerAddButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let minusButton = app.buttons["clickerSubtractButton"]
        let resetButton = app.buttons["clickerResetButton"]
        let valueLabel = app.staticTexts["clickerDisplayLabel"]
        let nameLabel = app.textFields["clickerNameTextField"]
        
        // Given I have the app installed
        // When I launch the application
        
        // Then
        // I will see the UI elements
        XCTAssertTrue(plusButton.exists)
        XCTAssertTrue(minusButton.exists)
        XCTAssertTrue(resetButton.exists)
        XCTAssertTrue(valueLabel.exists)
        XCTAssertTrue(nameLabel.exists)
    }
    
    /// Tests the reset flow when a user wants to reset their work
    func testResetFlow() {
        let plusButton = app/*@START_MENU_TOKEN@*/.buttons["clickerAddButton"]/*[[".buttons[\"+\"]",".buttons[\"clickerAddButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let minusButton = app.buttons["clickerSubtractButton"]
        let resetButton = app.buttons["clickerResetButton"]
        let label = app.staticTexts["clickerDisplayLabel"]
        let resetStringValue = "000"
        
        // Given
        // I have some value in the clicker
        plusButton.tap()
        plusButton.tap()
        plusButton.tap()
        minusButton.tap()
        
        // When
        // I tap on the reset button
        resetButton.tap()
        
        // Then
        // I should see the default state in the label
        XCTAssertEqual(label.value as! String, resetStringValue)
    }
    
    /// Tests the name change functionality
    func testNameChangeFlow() {
        let nameTextField = app.textFields["clickerNameTextField"]
        let sampleName = "Church Clicker"
        
        // Given I am on the Clicker screen
        
        // When
        // I tap on the name text field
        nameTextField.tap()
        
        // Then
        // A keyboard will display, allowing me to edit the name
        XCTAssertEqual(app.keyboards.count, 1)
        
        
        // Given I have edited the clicker name
        nameTextField.clearAndEnter(text: sampleName)
        
        // When
        // I tap "Return" on the keyboard
        app.buttons["Return"].tap() // Return key is accessed as a button, not a key
        
        // Then
        // The keyboard will dismiss
        // And my edited name will be displayed in the text field
        XCTAssertEqual(app.keyboards.count, 0)
        XCTAssertEqual(nameTextField.value as! String, sampleName)
    }

//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}

extension XCUIElement {
    
    /// Automatically taps into a text field and clears the text, entering new text if provided
    /// Solution from https://stackoverflow.com/questions/32821880/ui-test-deleting-text-in-text-field
    /// - Parameter text: text to enter, if desired
    func clearAndEnter(text: String?) {
        guard let stringValue = self.value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        self.tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        self.typeText(deleteString)
        
        guard let desiredText = text else { return }
        
        self.typeText(desiredText)
    }
}
