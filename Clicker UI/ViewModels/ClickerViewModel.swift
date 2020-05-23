//
//  ClickerViewModel.swift
//  Clicker UI
//
//  Created by CJ Willis on 5/22/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import Foundation

public class ClickerViewModel {
    
    // MARK: Variables
    private var clicker: Clicker
    
    /// The formatted display value for the clicker value. Formats to 3 digits always
    public var clickerDisplayValue: String {
        return String(format: "%03d", clickerValue)
    }
    
    /// Raw value of the clicker
    public var clickerValue: Int {
        return clicker.count
    }
    
    /// The name of the clicker
    public var clickerName: String {
        return clicker.name
    }
    
    // MARK: Initialization
    init(withClicker clicker: Clicker?) {
        self.clicker = clicker ?? Clicker(clickerName: nil, clickerCount: nil)
    }
    
    // MARK: Methods
    /// Adds value to the clicker if it has not reached the maximum (999)
    func incrementClicker() {
        guard clicker.count < 999 else {
            print("Clicker has reached its maximum limit; will not perform increment")
            return
        }
        
        clicker.count += 1
    }
    
    /// Subtracts value from the clicker if it has not reached the minimum (0)
    func decrementClicker() {
        guard clicker.count > 0 else {
            print("Clicker has reached its minimum limit; will not perform decrement")
            return
        }
        
        clicker.count -= 1
    }
    
    /// Resets the clicker to 0
    func resetClickerValue() {
        clicker.count = 0
    }
    
    /// Modifies the clicker's name
    /// - Parameter newName: new name for the clicker
    func changeClickerName(to newName: String) {
        clicker.name = newName
    }
    
}
