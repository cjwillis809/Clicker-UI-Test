//
//  Clicker_UITests.swift
//  Clicker UITests
//
//  Created by CJ Willis on 5/22/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import XCTest
@testable import Clicker_UI

class ClickerViewModelTests: XCTestCase {

    var viewModel: ClickerViewModel! // I hate using ! but it'll have to do for now
    
    override func setUp() {
        viewModel = ClickerViewModel(withClicker: Clicker(clickerName: nil, clickerCount: nil))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Tests incrementation sucess and limit
    func testAddingToClicker() {
        viewModel = ClickerViewModel(withClicker: Clicker(clickerName: nil, clickerCount: 998))
        viewModel.incrementClicker()
        
        XCTAssertTrue(viewModel.clickerValue == 999)
        
        // Test increment limit
        viewModel.incrementClicker()
        XCTAssertFalse(viewModel.clickerValue == 1000)
    }
    
    /// Tests subtracting success and limit
    func testSubtractingClickerValue() {
        // This should not change the clicker value, as it is already 0.
        viewModel.decrementClicker()
        XCTAssertTrue(viewModel.clickerValue == 0)
        
        // Add 3 times and then subtract 1
        viewModel.incrementClicker()
        viewModel.incrementClicker()
        viewModel.incrementClicker()
        viewModel.decrementClicker()
        XCTAssertTrue(viewModel.clickerValue == 2)
    }
    
    /// Tests reset logic
    func testResettingClicker() {
        viewModel.incrementClicker()
        viewModel.incrementClicker()
        viewModel.incrementClicker()
        viewModel.resetClickerValue()
        
        XCTAssertTrue(viewModel.clickerValue == 0)
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
