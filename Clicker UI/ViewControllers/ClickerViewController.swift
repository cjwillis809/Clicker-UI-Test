//
//  FirstViewController.swift
//  Clicker UI
//
//  Created by CJ Willis on 5/22/20.
//  Copyright © 2020 CJ Willis. All rights reserved.
//

import UIKit

class ClickerViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var clickerNameTextField: UITextField!
    @IBOutlet weak var clickerValueLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    
    // MARK: Variables
    var viewModel: ClickerViewModel = ClickerViewModel(withClicker: nil)
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clickerValueLabel.text = viewModel.clickerDisplayValue
        clickerNameTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        clickerNameTextField.text = viewModel.clickerName
    }
    
    // MARK: Action Methods
    @IBAction func addButtonTapped(_ sender: Any) {
        viewModel.incrementClicker()
        updateClickerLabel()
    }
    
    @IBAction func subtractButtonTapped(_ sender: Any) {
        viewModel.decrementClicker()
        updateClickerLabel()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        viewModel.resetClickerValue()
        updateClickerLabel()
    }
    
    // MARK: Utility Methods
    /// Ensure the clicker's name is updated in the correct scenarios
    func updateClickerName() {
        viewModel.changeClickerName(to: clickerNameTextField.text ?? "")
    }
    
    /// Ensures the clicker value label and accessibility value are updated properly
    func updateClickerLabel() {
        clickerValueLabel.text = viewModel.clickerDisplayValue
        // Accessibility value needs to be updated for UI tests
        clickerValueLabel.accessibilityValue = viewModel.clickerDisplayValue
    }
    
    // MARK: UITextFieldDelegate Methods
    /// Dismisses the keyboard upon tapping the Return key
    /// - Parameter textField: text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        updateClickerName()
        return false
    }
    
    /// Override to know when a user touches outside of the keybaord
    /// - Parameter touches: touches
    /// - Parameter event: event
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        updateClickerName()
    }
    
}

