//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
var tip = 0.10
var numberOfPeople = 2
var billTotal = 0.0
var finalResult = "0.0"
class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
           tenPctButton.isSelected = false
           twentyPctButton.isSelected = false
           sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
       splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }

    @IBAction func calculatePressed(_ sender: Any) {
      let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            print(billTotal)
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            print(result)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "goToResults") as!  ResultViewController
        vc.result = finalResult
        vc.tip = Int(tip * 100)
        vc.split = numberOfPeople
        vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
//       performSegue(withIdentifier: "goToResults", sender: self)
    }

    
}

